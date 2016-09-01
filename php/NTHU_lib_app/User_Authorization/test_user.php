<?php
	session_start();
	error_reporting(0);

	include '../connection.php';
	
	$sql = "SELECT * FROM users_table";
	
	$result = mysqli_query($conn, $sql);
	
	if(!$result){
		echo 'error';
	}else{
		while($row = mysqli_fetch_assoc($result))
			echo $row['users_userid'].' '.$row['users_name'];
	}

?>