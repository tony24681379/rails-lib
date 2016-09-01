<?php

require_once("./DB_config.php");
require_once("./DB_Class.php");
//header("Content-Type:text/html; charset=utf-8");
$db = new DB();
$db->connect_db($_DB['host'], $_DB['username'], $_DB['password'], $_DB['dbname']);
$stack = array();
$db->query("SET NAMES 'UTF8'");//this is important!!!!!!

if(isset($_GET['date'])){
	if(!preg_match("/^(19|20)\d\d[\-\/.](0[1-9]|1[012])[\-\/.](0[1-9]|[12][0-9]|3[01])$/",$_GET['date'])) exit("Wrong date format");
}
else exit("NO date parameter");

if(isset($_GET['state'])){
	if(!preg_match("/^[0-5]$/", $_GET['state'])) exit("Wrong state format state must 0 to 5");
}
if(isset($_GET['floor'])){
	if(!preg_match("/^(C[1234]|F[1-6])$/", $_GET['floor'])) exit("Wrong floor format, floor must C or F add a decimal");

	if($_GET['floor'][0] == "F"){
		$branchstring ="總圖";
		$floorstring  = $_GET['floor'][1];
	}
	else{
		if($_GET['floor'][1] == "3"){
			$branchstring ="總圖二電";
			$floorstring  = "2";
		}
		else if($_GET['floor'][1] == "4"){
			$branchstring ="總圖三電";
			$floorstring  = "3";
		}
		else{
			$branchstring ="人社";
			$floorstring  = $_GET['floor'][1];
		}
	}

	$floortmpstatus = $db->query("SELECT machine_id FROM machines WHERE branch = '".$branchstring."' and floor = '".$floorstring."'");
	$firstflag=1;
	
	

	$machine_string = " dailies.machine_id IN ";

	if($floortmpstatus->num_rows > 0){
		while($tmprow = $floortmpstatus->fetch_assoc()){
			if($firstflag == 1){
				$firstflag =0;
				$machine_string=$machine_string."('".$tmprow['machine_id']."'";
			}
			else{
				$machine_string=$machine_string.",'".$tmprow['machine_id']."'";
			}
		}
	}
	$machine_string=$machine_string.")";
}




if(isset($_GET['state']) && isset($_GET['floor'])){
	$querystatus=$db->query("SELECT dailies.date, dailies.machine_id, dailies.state, dailies.user_id, machines.place, machines.branch, machines.floor FROM dailies INNER JOIN machines ON dailies.machine_id = machines.machine_id COLLATE utf8_unicode_ci where date = '".$_GET['date']."' and state = '".$_GET['state']."' and ".$machine_string);
}
else if(isset($_GET['floor']) && (!isset($_GET['state']))){
	$querystatus=$db->query("SELECT dailies.date, dailies.machine_id, dailies.state, dailies.user_id, machines.place, machines.branch, machines.floor FROM dailies INNER JOIN machines ON dailies.machine_id = machines.machine_id COLLATE utf8_unicode_ci where date = '".$_GET['date']."' and ".$machine_string);
}
else if(isset($_GET['state']) && (!isset($_GET['floor']))){
	$querystatus=$db->query("SELECT dailies.date, dailies.machine_id, dailies.state, dailies.user_id, machines.place, machines.branch, machines.floor FROM dailies INNER JOIN machines ON dailies.machine_id = machines.machine_id COLLATE utf8_unicode_ci where date = '".$_GET['date']."' and state = '".$_GET['state']."'");
}
else if((!isset($_GET['state'])) && (!isset($_GET['floor'])) && isset($_GET['machine_id'])){
	$querystatus=$db->query("SELECT dailies.date, dailies.machine_id, dailies.state, dailies.user_id, machines.place, machines.branch, machines.floor FROM dailies INNER JOIN machines ON dailies.machine_id = machines.machine_id COLLATE utf8_unicode_ci where date = '".$_GET['date']."' and dailies.machine_id = '".$_GET['machine_id']."'");
}
else $querystatus=$db->query("SELECT dailies.date, dailies.machine_id, dailies.state, dailies.user_id, machines.place, machines.branch, machines.floor FROM dailies INNER JOIN machines ON dailies.machine_id = machines.machine_id COLLATE utf8_unicode_ci where date = '".$_GET['date']."'");
//echo $querystatus->num_rows;



if ($querystatus->num_rows > 0) {
	while($row = $querystatus->fetch_assoc()) {
		/*
			$machines_tmp = $db->query("SELECT place, branch , floor FROM machines where machine_id ='".$row['machine_id']."'");
			if($machines_tmp ->num_rows > 0){
				$place_row = $machines_tmp->fetch_assoc();
				//echo $place_row['place'];
			}
			else $place_row = array("place" => "無地點" , "branch" => "無地點" , "floor" => "無樓層");
		*/
		
		
		if($row['state'] != 0){
			$users_tmp = $db->query("SELECT username FROM users where id ='".$row['user_id']."'");
			if($users_tmp ->num_rows > 0){
				$username_row = $users_tmp->fetch_assoc();
				//echo $username_row['username'];
			}
			else $username_row = array("username" => "無");
		}
		else $username_row = array("username" => "無");
		
		
		if($row['state'] == 3 || $row['state'] == 4){
			$problem_tmp = $db->query("SELECT problem_detail, solve_detail, solve_date FROM daily_problems WHERE date = '".$_GET['date']."' AND machine_id = '".$row['machine_id']."'");
			if($problem_tmp ->num_rows > 0){
				$problem_detail_row = $problem_tmp->fetch_assoc();
				if($problem_detail_row['solve_detail']  == null) $problem_detail_row['solve_detail'] = "無";
				if($problem_detail_row['solve_date']  == null) $problem_detail_row['solve_date'] = "無";
			}
			else $problem_detail_row = array("problem_detail" => "無" , "solve_detail" => "無" ,"solve_date" => "無");
		}
		else{
			$problem_detail_row = array("problem_detail" => "無" , "solve_detail" => "無" ,"solve_date" => "無");
		}
		//echo $problem_detail_row['solve_date'];
		/*
		unset($row['id']);
		unset($row['created_at']);
		unset($row['updated_at']);
		unset($row['user_id']);*/
	
		array_push($stack,array_merge($row,$username_row,$problem_detail_row));
	}
	$return_string = json_encode($stack);
	echo $return_string;
}
else echo "No data";


/*
List all the data I need, by three parameter state, date, floor

ex:   http://192.168.1.105:8888/Nthu_lib_app/list_perticulor_problem.php?state=4&date=2016-07-18&floor=C1

*/

?>