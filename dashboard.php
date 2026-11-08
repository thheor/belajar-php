<?php
include("./database/database.php");

session_start();

if(!isset($_SESSION['email'])){
    header("location: login.php");
}

$query = mysqli_query($conn,"SELECT * FROM artists");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <thead>
            <tr>
        <th>
            Name
        </th>
        <th>
            Bio
        </th>
            </tr>
        </thead>
<?php
while ($row = mysqli_fetch_array($query)){
    ?>
    <tr>
        <td>
<?=$row["name"]?>
        </td>
        <td>
<?=$row["bio"]?>
        </td>
    </tr>
    <?php
}
?>
    </table>
</body>
</html>