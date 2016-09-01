<?php
require_once("./DB_config.php");
require_once("./DB_Class.php");
$db = new DB();
$db->connect_db($_DB['host'], $_DB['username'], $_DB['password'], $_DB['dbname']);



$querystatus=$db->query("INSERT INTO problem_table (floor,device_id,discover_date,problem,solve_date,solve_description,report_or_not,whoid,name) VALUES ('".$_GET['floor']."','".$_GET['device_id']."','".$_GET['discover_date']."','".$_GET['problem']."','".$_GET['solve_date']."','".$_GET['solve_description']."','".$_GET['report_or_not']."','".$_GET['whoid']."','".$_GET['name']."')");

/*
example url:
http://192.168.1.109:8888/NTHU_lib_app/add_problem.php?floor=3&device_id=f302&discover_date=2016/07/19&problem=keyboard2&solve_date=2016/07/31&solve_description=ok&report_or_not=1&whoid=334&name=eric
*/




?>


