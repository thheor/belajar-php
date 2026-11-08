<?php
include ("./database/database.php");

$username = $email = $password = "";
$error = "";

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    $checkEmail = $conn->prepare("SELECT email FROM users WHERE email = ?");
    $checkEmail->bind_param("s", $email);
    $checkEmail->execute();
    $checkEmail->store_result();

    if($checkEmail->num_rows > 0){
        $message = "Email is already exists";
    } else {
        $smt = $conn->prepare("INSERT INTO users (username, email, password) VALUE (?, ?, ?)");
        $smt->bind_param("sss", $username, $email, $password);

        if($smt->execute()){
            $message = "Account created successfulyy";

            header("location: /belajar/login.php");
        } else {
            $message = "Error: " . $smt->error;
        }
        $smt->close();
    }

    $checkEmail->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php if(!empty($message)) echo '<p>' .$message. '</p>'; ?>
    <form action="register.php" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username">
        <label for="email">Email</label>
        <input type="email" name="email" id="email">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <button type="submit">Submit</button>
    </form>
    <p>Already have an account? <a href="login.php">Login here</a></p>
</body>
</html>