<?php
$server = 'lib-mysql';
$username   = 'root';
$password   = 'javasql';
$database   = 's103062325';
$port = '3306';
$conn = mysqli_connect($server, $username, $password, $database, $port);
 
if(mysqli_connect_error()){
    exit('Error: could not establish database connection');
}

?>