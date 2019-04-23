Program Main;
{Program utama tubes}

uses  
    crt,
    uTipeData,
	uRegister, 			{F01}
	uLogin, 				{F02}
	uCari, 				{F03}
	uCariBukuTahunTerbit, 	{F04}
	uPinjamBuku, 			{F05}
	uPengembalianBuku,		{F06}
	uBukuHilang, 			{F07}
	uLaporanBukuHilang,	{F08}
	uTambahBukuBaru, 		{F09}
	uTambahJumlahBuku, 	{F10}
	uRiwayat, 				{F11}
	uStatistik, 			{F12}
	uLoadFile, 			{F13}
	uSaveFile, 			{F14}
	uCariAnggota;			{F15}

var
    Pelaku : User;
    role : Integer;
    jalan : Boolean;
    isLogin : Boolean;
    command : String;
    jawab : String;

    array_buku : Arr_buku;
	array_user : Arr_user;
	array_pinjam : Arr_Peminjaman;
	array_kembali : Arr_Pengembalian;
	array_hilang : Arr_Laporan_Buku_Hilang;


begin
    jalan := True;
    isLogin := False;
    ClrScr;
    WriteLn('================================================================================');
    load_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
    Pelaku.Nama := '';

    while jalan do begin
        if isLogin then begin
            if (Pelaku.Role = 'Admin') then begin
                role := 1;
            end else begin
                role := 0;
            end;
        end else begin
            role := 99;
        end;

        Write('$ ');
        ReadLn(command);

        case command of 
            'register' : 
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    register(array_user);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'login' :
                if isLogin then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Anda sudah login');
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    login(array_user, Pelaku);
                    WriteLn(Pelaku.Role);
                    WriteLn();
                    isLogin := True;
                end;
            'cari' : begin
                ClrScr;
                WriteLn('================================================================================');
                Cari(array_buku);
                WriteLn();
            end;
            'caritahunterbit' : begin
                ClrScr;
                WriteLn('================================================================================');
                CariTahunTerbit(array_buku);
                WriteLn();
            end;
            'pinjam_buku' :
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    pinjam_buku(array_buku,array_pinjam,Pelaku.Nama); 
                    WriteLn();
                end;
            'kembalikan_buku' :                                         
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    kembalikan_buku(array_buku,array_pinjam,array_kembali,Pelaku.Nama);
                    WriteLn();
                end;
            'lapor_hilang' :
                if (role <> 0) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    bukuhilang(array_buku,array_hilang,Pelaku.Nama);
                    WriteLn();
                end;
            'lihat_laporan' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    laporanbukuhilang(array_hilang);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'tambah_buku' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    tambah_buku_baru(array_buku);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'tambah_jumlah_buku' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    tambah_jumlah_buku(array_buku);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'riwayat' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    riwayat(array_pinjam,array_buku);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'statistik' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    statistik(array_user,array_buku);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'save' : begin
                ClrScr;
                WriteLn('================================================================================');
                save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
                WriteLn();
            end;
            'cari_anggota' :
                if (role = 1) then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    cari_anggota(array_user);
                    WriteLn();
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    WriteLn('Maaf Anda bukan Admin');
                    WriteLn();
                end;
            'exit' : begin
                ClrScr;
                WriteLn('================================================================================');
                Write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
                ReadLn(jawab);
                WriteLn();
                if (jawab = 'Y') then begin
                    ClrScr;
                    WriteLn('================================================================================');
                    save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
                    jalan := False;
                end else begin
                    ClrScr;
                    WriteLn('================================================================================');
                    jalan := False;
                end;
            end;
        end;
    end;
end.