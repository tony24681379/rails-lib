<?php

include './connection.php';

echo mysqli_real_escape_string($conn,"\'\\");

?>