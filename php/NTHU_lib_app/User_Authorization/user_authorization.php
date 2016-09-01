<?php
	session_start();
	error_reporting(0);

	include '../connection.php';
	
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$sql = "SELECT 
					id, 
					username 
				FROM 
					s103062325.users 
				WHERE 
					account = '" . mysqli_real_escape_string($conn, $_POST['userid']) . "'";
					
		$result = mysqli_query($conn, $sql);
		
		if(!$result){
			echo json_encode(array("server"=>"UNFOUND"));
        	exit;	
		}else{
			if(mysqli_num_rows($result) == 0){
				$response = array("secure"=>"UNAUTHORIZED");
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$response = array("secure"=>"AUTHORIZED", 
										"user-id"=>$row['id'],  
										"name"=>$row['username']);
				}
			}
			
			echo json_encode(array("server"=>$response));
			mysqli_close($conn);
		}
	}
	
?>