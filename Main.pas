Program Main;
{Program utama tubes}

uses  
    crt,
    uTipeData,              
	uRegister, 			    {F01}
	uLogin, 				{F02}
	uCari, 				    {F03}
	uCariBukuTahunTerbit, 	{F04}
	uPinjamBuku, 			{F05}
	uPengembalianBuku,		{F06}
	uBukuHilang, 			{F07}
	uLaporanBukuHilang,	    {F08}
	uTambahBukuBaru, 		{F09}
	uTambahJumlahBuku, 	    {F10}
	uRiwayat, 				{F11}
	uStatistik, 			{F12}
	uLoadFile, 			    {F13}
	uSaveFile,   			{F14}
	uCariAnggota;			{F15}

var
    Pelaku  : User;
    role    : Integer;
    jalan   : Boolean;
    isLogin : Boolean;
    command : String;
    jawab   : String;

    array_buku      : Arr_buku;
	array_user      : Arr_user;
	array_pinjam    : Arr_Peminjaman;
	array_kembali   : Arr_Pengembalian;
	array_hilang    : Arr_Laporan_Buku_Hilang;


begin
    jalan   := True;
    isLogin := False;
    ClrScr;
    WriteLn('================================================================================');
    load_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
    Pelaku.Nama := '';

    while jalan do begin
        // Inisiasi role
        if isLogin then begin
            if (Pelaku.Role = 'Admin') then begin
                role := 1;
            end else begin
                role := 0;
            end;
        end else begin
            role := 99;
        end;

        // Perintah
        Write('$ ');
        ReadLn(command);

        case command of 
            'register' : 
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ register');
                    register(array_user);
                    WriteLn();
                end else begin { Bukan Admin}
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ register');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'login' :
                if isLogin then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ login');
                    WriteLn('Anda sudah login');
                    WriteLn();
                end else begin { Belum Login }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ login');
                    login(array_user, Pelaku);
                    WriteLn();
                    isLogin := True;
                end;
            'cari' : begin
                ClrScr;
                WriteLn('================================================================================');
                WriteLn('$ cari');
                Cari(array_buku);
                WriteLn();
            end;
            'caritahunterbit' : begin
                ClrScr;
                WriteLn('================================================================================');
                WriteLn('$ caritahunterbit');
                CariTahunTerbit(array_buku);
                WriteLn();
            end;
            'pinjam_buku' :
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ pinjam_buku');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin { Pengguna yang sudah login}
                    ClrScr;
                    WriteLn('================================================================================');
                    pinjam_buku(array_buku,array_pinjam,Pelaku.Username); 
                    WriteLn();
                end;
            'kembalikan_buku' :                                         
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ kembalikan_buku');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    kembalikan_buku(array_buku,array_pinjam,array_kembali,Pelaku.Username);
                    WriteLn();
                end;
            'lapor_hilang' :
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ lapor_hilang');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin { Pengguna yang sudah login}
                    ClrScr;
                    WriteLn('================================================================================');
                    bukuhilang(array_buku,array_hilang,Pelaku.Username);
                    WriteLn();
                end;
            'lihat_laporan' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ lihat_laporan');
                    laporanbukuhilang(array_hilang);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ lihat_laporan');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'tambah_buku' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ tambah_buku');
                    tambah_buku_baru(array_buku);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ tambah_buku');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'tambah_jumlah_buku' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ tambah_jumlah_buku');
                    tambah_jumlah_buku(array_buku);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ tambah_jumlah_buku');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'riwayat' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ riwayat');
                    riwayat(array_pinjam,array_buku);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ riwayat');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'statistik' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ statistik');
                    statistik(array_user,array_buku);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ statistik');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'save' : begin
                ClrScr;
                WriteLn('================================================================================');
                WriteLn('$ save');
                save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
                WriteLn();
            end;
            'cari_anggota' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ cari_anggota');
                    cari_anggota(array_user);
                    WriteLn();
                end else begin { Selain Admin }
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('$ cari_anggota');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'exit' : begin
                ClrScr;
                WriteLn('================================================================================');
                WriteLn('$ exit');
                Write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
                ReadLn(jawab);
                WriteLn();
                if (jawab = 'Y') then begin
                    save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
                    jalan := False;
                end else begin { 'N' }
                    ClrScr;
                    jalan := False;
                end;
            end;
        end;
    end;
end.