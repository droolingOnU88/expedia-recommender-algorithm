<?php
ini_set('xdebug.max_nesting_level', 2000);	
	
$minNumberOfBookingsRequired = 10;
$maxNumberOfBookingsRequired = 30;

$selectedYear = '2014';

$expediaTableName = 'expedia-all-bookings-'.$selectedYear.'-reduced';
$expediaTableNameResult = 'expedia-user-hotel-probability-'.$selectedYear;
$expediaTableNameRelevantUsers = 'expedia-relevant-users-'.$selectedYear;

$numberOfHotels = 100; // Based on Expedia, there is a max of hotels of 100.

/**
	Remote (server) database connection.	
*/
function connectToDb()
{
	global $link; 
	
	$link = new mysqli("localhost","home-no-pw","", "expedia");
	
	if (mysqli_connect_errno()) {
    	printf("Connect failed: %s\n", mysqli_connect_error());
    	exit();
	}
}

/**
	Local database connection.	
*/
function connectToDbLocal()
{
	global $link; 
	
	$link = new mysqli("localhost","root","", "expedia-test");
	
	if (mysqli_connect_errno()) {
    	printf("Connect failed: %s\n", mysqli_connect_error());
    	exit();
	}
}

/**
	Truncate the database.	
*/
function preparations()
{
	global $link, $expediaTableNameResult, $expediaTableNameRelevantUsers; 
	
	$link->query('TRUNCATE `'.$expediaTableNameResult.'`');
	$link->query('TRUNCATE `'.$expediaTableNameRelevantUsers.'`');
	
}

/**
	Function elaborates all users who have conducted a
	min amount of bookings and do not exceed a max amount
	of bookings.	
*/
function findAllRelevantUsers()
{
	global $link, $minNumberOfBookingsRequired, $maxNumberOfBookingsRequired, $expediaTableName, $expediaTableNameRelevantUsers;
	printf('[findAllRelevantUsers]: Start.'.PHP_EOL);		

	$result = $link->query('SELECT count(user_id) AS `numberOfBookings`, user_id FROM `'.$expediaTableName.'` GROUP BY `user_id`; ');
	
	printf('[findAllRelevantUsers]: Number of Elements: '.mysqli_num_rows($result).PHP_EOL);
	while ($userObject = $result->fetch_object()) {
		if($userObject->numberOfBookings >= $minNumberOfBookingsRequired && $userObject->numberOfBookings <= $maxNumberOfBookingsRequired) {
			$link->query('INSERT INTO `'.$expediaTableNameRelevantUsers.'` (`id`, `user_id`) VALUES (NULL, '.$userObject->user_id.')');
		}	
	}
}

/**
	Base function to call in order to start the probability 
	calculation for every hotel cluster.	
*/
function calculateProbability()
{
	global $link, $numberOfHotels, $expediaTableNameRelevantUsers; 
	printf('[calculateProbability]: Start.'.PHP_EOL);	
	
	$users = $link->query('SELECT `user_id` FROM `'.$expediaTableNameRelevantUsers.'`;');
	
	$numberOfHotelsIncrement = 1;
	while ($numberOfHotels >= $numberOfHotelsIncrement) {
		$usersWhoLikeHotel = findUsersWhoLikeHotel($numberOfHotelsIncrement);	
		
		if(count($usersWhoLikeHotel)>0) {
			findReferralProbability($usersWhoLikeHotel, $numberOfHotelsIncrement);	
		}
		
		$numberOfHotelsIncrement++;
	}			
}

/**
	Return list LH = {u1, ... ,un} of all users who do like hotel_id	
*/
function findUsersWhoLikeHotel($hotel_id)
{
	global $link, $numberOfHotels, $expediaTableName, $expediaTableNameRelevantUsers; 
	printf('[findUsersWhoLikeHotel]: Start.'.PHP_EOL);
	
	$bookings = $link->query('SELECT `user_id` FROM `'.$expediaTableName.'` WHERE `hotel_cluster`='.$hotel_id.';');
	
	$usersWhoLikeHotel = Array();
	if($bookings) {
		while ($bookingObject = $bookings->fetch_object()) {
			$users = $link->query('SELECT `user_id` FROM `'.$expediaTableNameRelevantUsers.'` WHERE `user_id`='.$bookingObject->user_id.';');
			
			if($users) {
				if(mysqli_num_rows($users) > 0 && mysqli_num_rows($users) < 2) {
					array_push($usersWhoLikeHotel, $users->fetch_row());	
				} else if(mysqli_num_rows($users) > 1) {
					printf('The list `'.$expediaTableNameRelevantUsers.'` is not clean. User '.$bookingObject->user_id.' is present multiple times.'.PHP_EOL);
				}	
			}
		}	
	}
	
	return $usersWhoLikeHotel;
}

/**
	Calculates the probability value of a successful referral taking
	place.	
*/
function findReferralProbability($usersWhoLikeHotel, $hotel_id)
{
	global $link, $numberOfHotels, $expediaTableNameResult; 
	printf('[findHotelsOfUser]: Start.'.PHP_EOL);
	
	$numberOfHotelsIncrement = 1;
	while ($numberOfHotels >= $numberOfHotelsIncrement) {
		if($hotel_id !== $numberOfHotelsIncrement) {
			$likes = findUsersWhoLikeHotel($numberOfHotelsIncrement);
			
			$probability = count($likes) / count($usersWhoLikeHotel);
			if($probability > 1) {$probability=1; printf('Probability is greater than 1: '.$numberOfHotelsIncrement.' '.$hotel_id.' '.count($usersWhoLikeHotel));}
			
			$link->query('INSERT INTO `'.$expediaTableNameResult.'` (`id`, `hotel_id`, `probability`, `like_hotel`) VALUES (NULL, '.$hotel_id.', '.$probability.', '.$numberOfHotelsIncrement.')');
		}	
		$numberOfHotelsIncrement++;
	}
}


function compareProbabilities()
{
	global $link, $numberOfHotels, $expediaTableNameResult; 
	printf('[compareProbabilities]: Start.'.PHP_EOL);
	
	$link->query('TRUNCATE `expedia-user-hotel-probability-comparison-2013-2014`');
	
	$numberOfHotelsIncrement = 1;
	while ($numberOfHotels >= $numberOfHotelsIncrement) {
		$numberOfHotelsIncrementSub = 1;
		
		while ($numberOfHotels >= $numberOfHotelsIncrementSub) {
			$probabilities_2013 = $link->query('SELECT * FROM `expedia-user-hotel-probability-2013` WHERE hotel_id='.$numberOfHotelsIncrement.' AND like_hotel='.$numberOfHotelsIncrementSub);
			$probabilities_2014 = $link->query('SELECT * FROM `expedia-user-hotel-probability-2014` WHERE hotel_id='.$numberOfHotelsIncrement.' AND like_hotel='.$numberOfHotelsIncrementSub);	
			
			if($probabilities_2013 && $probabilities_2014) {
				$p2013 = $probabilities_2013->fetch_row();
				$p2014 = $probabilities_2014->fetch_row();
				
				//var_dump($p2013);
				
				$volatility = abs(floatval($p2013[2]) - floatval($p2014[2]));
				$link->query('INSERT INTO `expedia-user-hotel-probability-comparison-2013-2014` (id, hotel_id, volatility, like_hotel) VALUES (NULL, '.$numberOfHotelsIncrement.', '.$volatility.', '.$numberOfHotelsIncrementSub.');');	
			}
			
			$numberOfHotelsIncrementSub++;	
		}
		
		$numberOfHotelsIncrement++;
	}	
	
}

// Function call stack
connectToDbLocal();
//preparations();
//findAllRelevantUsers();
//calculateProbability();

compareProbabilities();	
?>