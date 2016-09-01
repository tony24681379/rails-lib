<?php

class DB 
{
    var $_dbConn = 0;
    var $_queryResource = 0;
    
    function DB()
    {
        //do nothing
    }
    
    function connect_db($host, $user, $pwd, $dbname)
    {
        $dbConn = new mysqli($host, $user, $pwd, $dbname,'3306');
        if ($dbConn->connect_error) {
    		die("Connection failed: " . $dbConn->connect_error);
		} 
        $this->_dbConn = $dbConn;
        return true;
    }
    
    function close(){
    $this->_dbConn->close();
    
    }
    
    function query($sql)
    {
        $queryResource = $this->_dbConn->query($sql);
        $this->_queryResource = $queryResource;
        if($queryResource != TRUE) return $this->_dbConn->error;
        else return $queryResource;
    }
    
    
}
?>