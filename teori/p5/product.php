<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <table>

    <?php
        $koneksi = mysqli_connect("localhost", "root", "", "nwind");
        $sql = "select * from products";
        $hasil = mysqli_query($koneksi, $sql);
        //var_dump($hasil);
        // $record = mysqli_fetch_assoc($hasil);
        // var_dump($record);
        // $record = mysqli_fetch_assoc($hasil);
        // var_dump($record);

        while($record = mysqli_fetch_assoc($hasil)) {
            //var_dump($record["ProductName"]);
            
            ?>
            <tr>
                <td><?=$record["ProductID"]?></td>
                <td><?=$record["ProductName"]?></td>
                <td><?=$record["UnitPrice"]?></td>
            </tr>
            <?php
        }
    ?>

</table>
    
</body>
</html>