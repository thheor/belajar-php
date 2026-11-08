<?php
    session_name("sesi1");
    session_start();
    // http://localhost/pw-h/p7/shoppingchart.php?pid=2&jumlah=4
    $pid = $_GET["pid"];
    $jumlah = $_GET["jumlah"];
    $_SESSION["keranjang"][$pid] = $jumlah;

    //var_dump($_SESSION["keranjang"]);

    $koneksi = mysqli_connect("localhost", "root", "", "nwind");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table border="1px">
        <?php
            $sum = 0;
            foreach($_SESSION["keranjang"] as $pid => $jumlah) {
                $sql = "select * from products where ProductID = $pid";
                $data = mysqli_query($koneksi, $sql);
                $row = mysqli_fetch_assoc($data);
                $subTotal = $row["UnitPrice"] * $jumlah;
                $sum = $sum + $subTotal;
                ?>
                <tr>
                    <td><?=$pid?></td>
                    <td><?=$row["ProductName"]?></td>
                    <td><?=$row["UnitPrice"]?></td>
                    <td><?=$jumlah?></td>
                    <td><?=$subTotal?></td>
                </tr>
                <?php
            }

        ?> 
        <tr>
            <td></td>
            <td colspan="3"> Total </td>
            <td><?=$sum?></td>
        </tr> 
    </table>
</body>
</html>