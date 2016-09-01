<?php
	session_start();
	error_reporting(0);
	
	include '../connection.php';
	mysqli_set_charset($conn, "utf8");
	
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$machine_id = mysqli_real_escape_string($conn, $_POST['machine_id']);
		$date = mysqli_real_escape_string($conn, $_POST['date']);
		$user_name = mysqli_real_escape_string($conn, $_POST['user_id']);
		$state = mysqli_real_escape_string($conn, $_POST['state']);
		
		$sql = "SELECT 
					state 
				FROM 
					s103062325.dailies 
				WHERE 
					machine_id = '" . $machine_id . "' 
				AND 
					date = '" . $date . "'";
		
		$result = mysqli_query($conn, $sql);
		if(!$result){
			//failed getting data from database
			echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
		}else{
			if(mysqli_num_rows($result) == 0){
				//no data, create new data
				$sql = "INSERT INTO s103062325.dailies(date, machine_id, state, user_id) VALUES('$date', '$machine_id', '$state', '$user_name')";

				$result = mysqli_query($conn, $sql);
				if(!$result){
					//failed insert data to database
					echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
				}else{
					switch ($state) {
						case 3:
							//問題排除
							$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
							$solution = mysqli_real_escape_string($conn, $_POST['solve_detail']);
							$name = mysqli_real_escape_string($conn, $_POST['user_name']);

							$sql = "INSERT INTO s103062325.daily_problems(date, machine_id, user_id, problem_detail, solve_detail, solve_date) VALUES('$date', '$machine_id', '$name', '$problem_detail', '$solution', '$date')";

							$result = mysqli_query($conn, $sql);
							if(!$result){
								//failed insert data to database
								echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
							}else{
								//success!
								echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							}
							break;
						
						case 4:
							//通知人員
							$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
							$name = mysqli_real_escape_string($conn, $_POST['user_name']);

							$sql = "INSERT INTO s103062325.daily_problems(date, machine_id, user_id, problem_detail) VALUES('$date', '$machine_id', '$name', '$problem_detail')";

							$result = mysqli_query($conn, $sql);
							if(!$result){
								//failed insert data to database
								echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
							}else{
								//success!
								echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							}
							break;

						default:
							//平常
							echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							break;
					}
				}
			}else{
				//there exist a data, update the data
				$currState;
				while($row = mysqli_fetch_assoc($result)){
					$currState = $row['state'];
				}

				if($currState != $state){
					$sql = "UPDATE 
								s103062325.dailies 
							SET 
								state=$state 
							WHERE 
								machine_id='" . $machine_id . "' 
							AND 
								date = '" . $date . "'";

					$result = mysqli_query($conn, $sql);
					if(!$result){
						echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
					}else{
						switch ($state){
							case 3:
								//問題排除
								$sql = "SELECT * FROM s103062325.daily_problems WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

								$result = mysqli_query($conn, $sql);
								if(!$result){
									echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
								}else{
									if(mysqli_num_rows($result) == 0){
										//create new problem
										$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
										$solution = mysqli_real_escape_string($conn, $_POST['solve_detail']);
										$name = mysqli_real_escape_string($conn, $_POST['user_name']);

										$sql = "INSERT INTO s103062325.daily_problems(date, machine_id, user_id, problem_detail, solve_detail, solve_date) VALUES('$date', '$machine_id', '$name', '$problem_detail', '$solution', '$date')";

										$result = mysqli_query($conn, $sql);
										if(!$result){
											//failed insert data to database
											echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
										}else{
											//success!
											echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
										}
									}else{
										//update problem
										$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
										$solution = mysqli_real_escape_string($conn, $_POST['solve_detail']);
										$name = mysqli_real_escape_string($conn, $_POST['user_name']);

										$sql = "UPDATE s103062325.daily_problems SET problem_detail = '" . $problem_detail . "', solve_detail = '" . $solution . "', solve_date = '" . $date . "' WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

										$result = mysqli_query($conn, $sql);
										if(!$result){
											//failed insert data to database
											echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
										}else{
											//success!
											echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
										}
									}
								}
								break;
							
							case 4:
								//通知人員
								$sql = "SELECT * FROM s103062325.daily_problems WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

								$result = mysqli_query($conn, $sql);
								if(!$result){
									echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
								}else{
									if(mysqli_num_rows($result) == 0){
										//create new problem
										$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
										$name = mysqli_real_escape_string($conn, $_POST['user_name']);

										$sql = "INSERT INTO s103062325.daily_problems(date, machine_id, user_id, problem_detail) VALUES('$date', '$machine_id', '$name', '$problem_detail')";

										$result = mysqli_query($conn, $sql);
										if(!$result){
											//failed insert data to database
											echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
										}else{
											//success!
											echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
										}
									}else{
										//update problem
										$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
										$name = mysqli_real_escape_string($conn, $_POST['user_name']);

										$sql = "UPDATE s103062325.daily_problems SET problem_detail = '" . $problem_detail . "' WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

										$result = mysqli_query($conn, $sql);
										if(!$result){
											//failed insert data to database
											echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
										}else{
											//success!
											echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
										}
									}
								}
								break;

							default:
								//平常 check if there and problem in dailies_problem. If yes, delete it!
								$sql = "SELECT * FROM s103062325.daily_problems WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

								$result = mysqli_query($conn, $sql);
								if(!$result){
									echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
								}else{
									if(mysqli_num_rows($result) == 0){
										echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
									}else{
										$sql = "DELETE FROM s103062325.daily_problems WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

										$result = mysqli_query($conn, $sql);
										if(!$result){
											echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
										}else{
											echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
										}
									}
								}
								break;
						}	
					}
				}else{
					switch ($state) {
						case 3:
							//問題排除
							$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
							$solution = mysqli_real_escape_string($conn, $_POST['solve_detail']);
							$name = mysqli_real_escape_string($conn, $_POST['user_name']);

							$sql = "UPDATE s103062325.daily_problems SET problem_detail = '" . $problem_detail . "', solve_detail = '" . $solution . "' WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

							$result = mysqli_query($conn, $sql);
							if(!$result){
								//failed insert data to database
								echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
							}else{
								//success!
								echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							}
							break;

						case 4:
							//通知人員
							$problem_detail = mysqli_real_escape_string($conn, $_POST['problem_detail']);
							$name = mysqli_real_escape_string($conn, $_POST['user_name']);

							$sql = "UPDATE s103062325.daily_problems SET problem_detail = '" . $problem_detail . "' WHERE machine_id = '" . $machine_id . "' AND date = '" . $date . "'";

							$result = mysqli_query($conn, $sql);
							if(!$result){
								//failed insert data to database
								echo json_encode(array('web_server' => 'failed', 'machine_id' => $machine_id));
							}else{
								//success!
								echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							}
							break;
						
						default:
							//平常
							echo json_encode(array('web_server' => 'success', 'machine_id' => $machine_id));
							break;
					}
				}
			}
		}
	}
	
?>