program testProgram;

uses
    uTipeData,
    uTanggal,
    uLogin,
    uRegister,
    uCari,
    uTambahJumlahBuku,
    uRiwayat,
    uStatistik;

var
    array_buku : Arr_Buku;
    array_user : Arr_User;
    array_peminjaman : Arr_Peminjaman;

begin
    SetLength(array_user, 4);
    array_user[0].username := 'wshitong997';
    array_user[0].password := 'wanshitongganteng';
    array_user[0].role := Pengunjung;

    array_user[1].username := 'ozer0532';
    array_user[1].password := 'uW!11N3v32G35D15S#!7';
    array_user[1].role := Admin;

    array_user[2].username := 'TuanYonpti';
    array_user[2].password := 'LuvNyaiRin';
    array_user[2].role := Pengunjung;

    array_user[3].username := 'johnDoe';
    array_user[3].password := 'password';
    array_user[3].role := Pengunjung;


    SetLength(array_buku, 4);
    array_buku[0].id_buku := 2247;
    array_buku[0].judul_buku := 'Motivasi Burger King';
    array_buku[0].jumlah_buku := 10;
    array_buku[0].kategori := Sejarah;
    
    array_buku[1].id_buku := 2001;
    array_buku[1].judul_buku := '97 things every programmer should know';
    array_buku[1].jumlah_buku := 22;
    array_buku[1].kategori := Programming;
    
    array_buku[2].id_buku := 3753;
    array_buku[2].judul_buku := 'Laskar Pelangi';
    array_buku[2].jumlah_buku := 11;
    array_buku[2].kategori := Sastra;
    
    array_buku[3].id_buku := 0532;
    array_buku[3].judul_buku := '0532 Reasons why Ozer is Amazing';
    array_buku[3].jumlah_buku := 9;
    array_buku[3].kategori := Sejarah;
    

    SetLength(array_peminjaman, 4);
    array_peminjaman[0].username := 'wshitong997';
    array_peminjaman[0].id_buku := 2247;
    array_peminjaman[0].tanggal_peminjaman := StringToTanggal('15/03/2019');

    array_peminjaman[1].username := 'wshitong997';
    array_peminjaman[1].id_buku := 2001;
    array_peminjaman[1].tanggal_peminjaman := StringToTanggal('29/03/2019');

    array_peminjaman[2].username := 'wshitong997';
    array_peminjaman[2].id_buku := 3753;
    array_peminjaman[2].tanggal_peminjaman := StringToTanggal('14/04/2019');

    array_peminjaman[3].username := 'ozer0532';
    array_peminjaman[3].id_buku := 0532;
    array_peminjaman[3].tanggal_peminjaman := StringToTanggal('15/03/2019');
end.