<?php
	session_start();

	include '../connection.php';
	mysqli_set_charset($conn, 'utf8');
	
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$place;
		$currState;
		$currProblem;
		$currSolution;
		$past1stDate;
		$past2ndDate;
		$past3rdDate;
		$past4thDate;
		$past5thDate;
		$past6thDate;
		$past7thDate;
		
		$sql = "SELECT 
					place 
				FROM 
					s103062325.machines 
				WHERE 
					machine_id = '" . $_POST['machine_number'] . "'";
	
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$place = "server error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$place = "no place info";
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$place = $row['place'];
				}
			}
		}

		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['date']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$currState = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$currState = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$currState = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past1stDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past1stDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past1stDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past1stDate = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past2ndDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past2ndDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past2ndDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past2ndDate = $row['state'];	
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past3rdDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past3rdDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past3rdDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past3rdDate = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past4thDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past4thDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past4thDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past4thDate = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past5thDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past5thDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past5thDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past5thDate = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past6thDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past6thDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past6thDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past6thDate = $row['state'];
				}
			}
		}
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
				AND 
					date = '" . mysqli_real_escape_string($conn, $_POST['past7thDate']) . "'";
					
		$result = mysqli_query($conn, $sql);
		if(!$result){
			$past7thDate = "error";
		}else{
			if(mysqli_num_rows($result) == 0){
				$past7thDate = 0;
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$past7thDate = $row['state'];
				}
			}
		}

		if($currState == 3){
			$sql = "SELECT 
						problem_detail, 
						solve_detail 
					FROM 
						s103062325.daily_problems 
					WHERE 
						machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
					AND 
						date = '" . mysqli_real_escape_string($conn, $_POST['date']) . "'";

			$result = mysqli_query($conn, $sql);
			if(!$result){
				$currProblem = "error";
				$currSolution = "error";
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$currProblem = $row['problem_detail'];
					$currSolution = $row['solve_detail'];
				}
			}
		}else if($currState == 4){
			$sql = "SELECT 
						problem_detail
					FROM 
						s103062325.daily_problems 
					WHERE 
						machine_id = '" . mysqli_real_escape_string($conn, $_POST['machine_number']) . "' 
					AND 
						date = '" . mysqli_real_escape_string($conn, $_POST['date']) . "'";

			$result = mysqli_query($conn, $sql);
			if(!$result){
				$currProblem = "error";
				$currSolution = "";
			}else{
				while($row = mysqli_fetch_assoc($result)){
					$currProblem = $row['problem_detail'];
					$currSolution = "";
				}
			}
		}else{
			$currProblem = "";
			$currSolution = "";
		}

		
		echo json_encode(array("server"=>array("place"=>$place, 
											"past1stDate"=>$past1stDate,
											"past2ndDate"=>$past2ndDate,
											"past3rdDate"=>$past3rdDate,
											"past4thDate"=>$past4thDate,
											"past5thDate"=>$past5thDate,
											"past6thDate"=>$past6thDate,
											"past7thDate"=>$past7thDate,
											"state"=>$currState,
											"problem_detail"=>$currProblem,
											"solve_detail"=>$currSolution)));
		mysqli_close($conn);
	}
?>