program testProgram;

uses
    uTipeData,
    uTanggal,
    uLogin,                 // F01
    uRegister,              // F02
    uCari,                  // F03
    uCariBukuTahunTerbit,   // F04
    uPinjamBuku,            // F05
    uPengembalianBuku,      // F06
    uBukuHilang,            // F07
    uTambahJumlahBuku,      // F10
    uRiwayat,               // F11
    uStatistik,             // F12
    uLoadFile,              // F13
    uSaveFile;              // F14

var
    array_buku : Arr_Buku;
    array_user : Arr_User;
    array_peminjaman : Arr_Peminjaman;
    array_pengembalian : Arr_Pengembalian;
    array_hilang : Arr_Laporan_Buku_Hilang;
    currentUser : String;

begin
    SetLength(array_user, 4);
    array_user[0].Nama := 'Wan Shi Tong';
    array_user[0].Alamat := 'Jl. Perpustakaan; Tengah Gurun 40135';
    array_user[0].username := 'wshitong997';
    array_user[0].password := 'wanshitongganteng';
    array_user[0].role := 'Pengunjung';

    
    array_user[1].Nama := 'ozer0532';
    array_user[1].Alamat := 'Jl. Buntu ODXXXII; Rumah Saya 00532';
    array_user[1].username := 'ozer0532';
    array_user[1].password := 'uW!11N3v32G35D15S#!7';
    array_user[1].role := 'Admin';

    
    array_user[2].Nama := 'Tuan Yon';
    array_user[2].Alamat := 'Labtek V HMIF; Jl. Ganesa ten';
    array_user[2].username := 'TuanYonpti';
    array_user[2].password := 'LuvNyaiRin';
    array_user[2].role := 'Pengunjung';

    
    array_user[3].Nama := 'John Doe';
    array_user[3].Alamat := 'Example Address; Example City 12345';
    array_user[3].username := 'johnDoe';
    array_user[3].password := 'password';
    array_user[3].role := 'Pengunjung';


    SetLength(array_buku, 4);
    array_buku[0].id_buku := 2247;
    array_buku[0].judul_buku := 'Motivasi Burger King';
    array_buku[0].Author := 'Gue';
    array_buku[0].jumlah_buku := 10;
    array_buku[0].Tahun_Penerbit := 2016;
    array_buku[0].kategori := 'Sejarah';
    
    array_buku[1].id_buku := 2001;
    array_buku[1].judul_buku := '97 things every programmer should know';
    array_buku[1].Author := 'Kelvin Henney';
    array_buku[1].jumlah_buku := 22;
    array_buku[1].Tahun_Penerbit := 2010;
    array_buku[1].kategori := 'Programming';
    
    array_buku[2].id_buku := 3753;
    array_buku[2].judul_buku := 'Laskar Pelangi';
    array_buku[2].Author := 'Andrea Hirata';
    array_buku[2].jumlah_buku := 11;
    array_buku[2].Tahun_Penerbit := 2005;
    array_buku[2].kategori := 'Sastra';
    
    array_buku[3].id_buku := 0532;
    array_buku[3].judul_buku := '0532 Reasons why Ozer is Amazing';
    array_buku[3].Author := 'ozer0532';
    array_buku[3].jumlah_buku := 9;
    array_buku[3].Tahun_Penerbit := 2350;
    array_buku[3].kategori := 'Sejarah';
    

    SetLength(array_peminjaman, 4);
    array_peminjaman[0].username := 'wshitong997';
    array_peminjaman[0].id_buku := 2247;
    array_peminjaman[0].tanggal_peminjaman := StringToTanggal('15/03/2019');
    array_peminjaman[0].Tanggal_Batas_Pengembalian := StringToTanggal('22/03/2019');
    array_peminjaman[0].Status_Pengembalian := 'belum';

    array_peminjaman[1].username := 'wshitong997';
    array_peminjaman[1].id_buku := 2001;
    array_peminjaman[1].tanggal_peminjaman := StringToTanggal('29/03/2019');
    array_peminjaman[1].Tanggal_Batas_Pengembalian := StringToTanggal('05/04/2019');
    array_peminjaman[1].Status_Pengembalian := 'belum';

    array_peminjaman[2].username := 'wshitong997';
    array_peminjaman[2].id_buku := 3753;
    array_peminjaman[2].tanggal_peminjaman := StringToTanggal('14/04/2019');
    array_peminjaman[2].Tanggal_Batas_Pengembalian := StringToTanggal('21/04/2019');
    array_peminjaman[2].Status_Pengembalian := 'belum';

    array_peminjaman[3].username := 'ozer0532';
    array_peminjaman[3].id_buku := 0532;
    array_peminjaman[3].tanggal_peminjaman := StringToTanggal('15/03/2019');
    array_peminjaman[3].Tanggal_Batas_Pengembalian := StringToTanggal('22/03/2019');
    array_peminjaman[3].Status_Pengembalian := 'sudah';


    SetLength(array_pengembalian, 1);
    array_pengembalian[0].Username := 'ozer0532';
    array_pengembalian[0].ID_Buku := 0532;
    array_pengembalian[0].Tanggal_Pengembalian := StringToTanggal('15/03/2019');


    SetLength(array_hilang, 1);
    array_hilang[0].Username := 'TuanYonPti';
    array_hilang[0].ID_Buku_Hilang := 3753;
    array_hilang[0].Tanggal_Laporan := StringToTanggal('21/04/2019');
    

    load_file(array_buku, array_user, array_peminjaman, array_pengembalian, array_hilang);

    currentUser := login(array_user);

    CariTahunTerbit(array_buku);

    //save_file(array_buku, array_user, array_peminjaman, array_pengembalian, array_hilang);
end.