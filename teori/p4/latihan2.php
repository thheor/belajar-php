<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
    <?php
        $pegawai = [
            "idPegawai" => 100,
            "nama" => "Dewi Mirani",
            "alamat" => "Jalan Babarsari No. 2",
            "kota" => "Sleman"
        ];

        // print "Id Pegawai : " . $pegawai["idPegawai"];

        
    ?>

    <table class = "table table-striped">
        <?php
            foreach($pegawai as $key => $value){
                // print $key . " : " . $value . "<br>";
                ?>
                <tr>
                    <td><?=$key?></td>
                    <td>:</td>
                    <td><?=$value?></td>
                </tr>
                <?php
            }
        ?>
    </table>

</body>
</html>