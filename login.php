<?php
include("./database/database.php");

$email = $password = "";

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $email = $_POST["email"];
    $password = $_POST["password"];

    $isEmailExist = $conn->prepare("SELECT email FROM users WHERE email = ?");
    $isEmailExist->bind_param("s", $email);
    $isEmailExist->execute();
    $isEmailExist->store_result();

    if($isEmailExist->num_rows > 0){
        $getPassword = $conn->prepare("SELECT password FROM users WHERE email = ?");
        $getPassword->bind_param("s", $email);
        $getPassword->execute();
        $result = $getPassword->get_result();

        $storedPassword = $result->fetch_assoc();

        if($password == $storedPassword["password"]){
            $message = "Login success";

            session_start();
            $_SESSION['email'] = $email;
            header("location: /belajar/dashboard.php");
        } else {
            $message = "Incorrect email or password";
        }

        $getPassword->close();
    }else {
        $message = "Email is not found";
    }

    $isEmailExist->close();
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
    <form action="login.php" method="POST">
        <label for="email">Email</label>
        <input type="email" name="email" id="email">
        <label for="password">Password</label>
        <input type="password" name="password" id="password">
        <button type="submit">Submit</button>
    </form>
</body>
</html>