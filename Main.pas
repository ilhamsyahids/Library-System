Program Utama;
{Program utama tubes}

uses uTipeData,
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
    role := 99;

    load_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
    while jalan do begin
        if isLogin then begin
            if (Pelaku.Role = 'Admin') then begin
                role := 1;
            end else begin
                role := 0;
            end;
        end;

        Write('$ ');
        ReadLn(command);

        case command of 
            'register' : 
                if (role = 1) then begin
                    register(array_user);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'login' :
                if isLogin then begin
                    WriteLn('Anda sudah login');
                end else begin
                    login(array_user, Pelaku);
                    WriteLn(Pelaku.Role);
                    isLogin := True;
                end;
            'cari' :
                Cari(array_buku);
            'caritahunterbit' :
                CariTahunTerbit(array_buku);
            'pinjam_buku' :
                if (role <> 0) then begin
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                end else begin
                    pinjam_buku(array_buku,array_pinjam,Pelaku.Nama); 
                end;
            'kembalikan_buku' :                                         
                if (role <> 0) then begin
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                end else begin
                    kembalikan_buku(array_buku,array_pinjam,array_kembali,Pelaku.Nama);
                end;
            'lapor_hilang' :
                if (role <> 0) then begin
                    WriteLn('Maaf, hanya untuk pengguna yang sudah login.');
                end else begin
                    bukuhilang(array_buku,array_hilang,Pelaku.Nama);
                end;
            'lihat_laporan' :
                if (role = 1) then begin
                    laporanbukuhilang(array_hilang);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'tambah_buku' :
                if (role = 1) then begin
                    tambah_buku_baru(array_buku);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'tambah_jumlah_buku' :
                if (role = 1) then begin
                    tambah_jumlah_buku(array_buku);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'riwayat' :
                if (role = 1) then begin
                    riwayat(array_pinjam,array_buku);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'statistik' :
                if (role = 1) then begin
                    statistik(array_user,array_buku);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'save' :
                save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
            'cari_anggota' :
                if (role = 1) then begin
                    cari_anggota(array_user);
                end else begin
                    WriteLn('Maaf Anda bukan Admin');
                end;
            'exit' : begin
                Write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
                ReadLn(jawab);
                if (jawab = 'Y') then begin
                    save_file(array_buku,array_user,array_pinjam,array_kembali,array_hilang);
                end else begin
                    jalan := False;
                end;
            end;
        end;
    end;
end.