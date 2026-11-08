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
    $karyawan = [
        [
            "idPegawai" => 100,
            "nama" => "Dewi Mirani",
            "alamat" => "Jalan Babarsari No. 2",
            "kota" => "Sleman"
        ],
        [
            "idPegawai" => 101,
            "nama" => "Radit",
            "alamat" => "Jalan Klaten No. 67",
            "kota" => "Klaten"
        ],
        [
            "idPegawai" => 102,
            "nama" => "Jeki",
            "alamat" => "Jalan Kebumen No. 66",
            "kota" => "Kota Kebumen"
        ],
        [
            "idPegawai" => 103,
            "nama" => "Faiz",
            "alamat" => "Jalan Monstad No. 77",
            "kota" => "Teyvat"
        ]
    ];
    ?>

    <table class="table table-striped">

        <tr>
            <th>ID Pegawai</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Kota</th>
        </tr>
        <?php
            foreach($karyawan as $key => $value){
                ?>
                <tr>
                    <td><?=$value['idPegawai']?></td>
                    <td><?=$value['nama']?></td>
                    <td><?=$value['alamat']?></td>
                    <td><?=$value['kota']?></td>
                </tr>
                <?php
            }
        ?>
    </table>
</body>

</html>