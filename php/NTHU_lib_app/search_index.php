<?php
require_once("./DB_config.php");
require_once("./DB_Class.php");
$db = new DB();
$db->connect_db($_DB['host'], $_DB['username'], $_DB['password'], $_DB['dbname']);

$stack = array();
$db->query("SET NAMES 'UTF8'");//this is important!!!!!!

$querystatus = $db->query("SELECT machine_id FROM machines");
if($querystatus->num_rows > 0){
	while($rowtmp = $querystatus->fetch_assoc()){
		array_push($stack,$rowtmp);
	}
	$return_string = json_encode($stack);
	echo $return_string;
}
else echo "Somthing Wrong with database";

?>