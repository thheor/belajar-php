<?php
echo "hello world";
$host = "localhost";
$user = "root";
$pass = "";
$db = "spotify";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Error: ". $conn->connect_error);
}
