<?php
	session_start();
	error_reporting(0);

	include '../connection.php';
	mysqli_set_charset($conn,"utf8");
	
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$branch = "總圖";
		if($_POST['branch'] == 1) $branch = "人社";
		
		$sql = "SELECT machine_id FROM s103062325.machines WHERE floor = " . $_POST['floor'] . " AND branch = '" . $branch . "';";
				
		$result = mysqli_query($conn, $sql);
		
		if(!$result){
			echo json_encode(array("server"=>"UNFOUND"));
        	exit;
		}else{
			if(mysqli_num_rows($result) == 0){
				$response = "NONE";
			}else{
				$response = array();
				while($row = mysqli_fetch_assoc($result)){
					array_push($response, $row);
				}
			}
			
			echo json_encode(array("server"=>array("machine_number"=>$response)));
			mysqli_close($conn);
		}
	}
?>