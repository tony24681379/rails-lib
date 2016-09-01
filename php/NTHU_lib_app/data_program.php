<?php
ignore_user_abort(true);
set_time_limit(0);
date_default_timezone_set("Asia/Taipei");

require_once("./DB_config.php");
require_once("./DB_Class.php");
//header("Content-Type:text/html; charset=utf-8");
$db = new DB();
$db->connect_db($_DB['host'], $_DB['username'], $_DB['password'], $_DB['dbname']);
/*
if(strcmp(date("H"),"00") ==0 ){
	echo "it's time to do somthing";
}
else echo "wrong";*/

//echo date('Y-m-d');

if(file_get_contents("./gate.cfg")=="Y"){
    $checktmp = $db->query("SELECT * from dailies where date = '".date('Y-m-d')."'");
    if($checktmp -> num_rows == 0){
    	$idstatustmp = $db->query("SELECT machine_id from machines");
		if($idstatustmp->num_rows > 0){
			while($keyrow = $idstatustmp->fetch_assoc()){
				$db->query("INSERT INTO dailies (date,machine_id,state,user_id) VALUES ('".date('Y-m-d')."','".$keyrow['machine_id']."','0','0')");
			}
		}
    }
}

?>