<?php
	session_start();
	error_reporting(0);
	
	header('Content-Type: text/html; charset=UTF-8');

	include '../connection.php';
	
	mysqli_set_charset($conn,"utf8");
	
	$sql = "SELECT * FROM Nthu_Library_Inspection_System.machines";
	
	$result = mysqli_query($conn, $sql);
	
	if(!$result){
		echo 'error';
	}else{
		while($row = mysqli_fetch_assoc($result))
			echo $row['branch'].' '.$row['place'] . ' ' . $row['maintain_group'].' '.$row['floor'] . ' ' . $row['machine_id'];
	}

?>