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
	array_buku : Arr_buku;
	array_user : Arr_user;
	array_pinjam : Arr_Peminjaman;
	array_kembali : Arr_Pengembalian;
	array_hilang : Arr_Laporan_Buku_Hilang;

	stop1, stop2 : boolean;
	pil1, pil2, keluar, konfirmasi : string;
	username : string;

begin
	stop1 := false;
	stop2 := false;
	writeln('Selamat Datang di Perpustakaan Kota Ba Sing Tse!');
	writeln('Anda dapat menemukan berbagai macam buku di seluruh dunia di perpustakaan ini.');
	writeln();
	writeln('Silakan ikuti perintah di bawah ini sebelum anda memulai!');
	load_file(array_buku, array_user, array_pinjam, array_kembali, array_hilang);
	writeln();
	writeln('1. Register');
	writeln('2. Login');
	writeln('Silakan masukkan pilihan anda :');
	readln(pil1);
	repeat
	case pil1 of
	'1' {Register}	: begin
						register(array_user);
					  end;
	'2' {Login}		: begin
						username := login(array_user);
						stop1 := true;
					  end;
	else
		begin
			writeln('Input salah!');
		end;
	end;
	until stop1 = true;
	
	if username = 'Admin' then
	begin
		repeat
		writeln('Menu Utama');
		writeln('1. Pencarian Buku Berdasarkan Kategori');
		writeln('2. Pencarian Buku Berdasarkan Tahun Terbit');
		writeln('3. Lihat Laporan Buku yang Hilang');
		writeln('4. Tambah Buku Baru ke Sistem');
		writeln('5. Tambah Jumlah Buku ke Sistem');
		writeln('6. Lihat Riwayat Peminjaman');
		writeln('7. Statistik');
		writeln('8. Pencarian Anggota');
		writeln('9. Keluar');
		write('> Masukkan pilihan menu: ');
		readln(pil2);

		case pil2 of
		'1' {Pencarian Buku Berdasarkan Kategori}		: begin
															Cari(array_buku);
														  end;
		'2' {Pencarian Buku Berdasarkan Tahun Terbit}	: begin
															CariTahunTerbit(array_buku);
														  end;
		'3' {Lihat Laporan Buku yang Hilang}			: begin
															laporanbukuhilang(array_hilang);
														  end;
		'4' {Tambah Buku Baru ke Sistem}				: begin
															tambah_buku_baru(array_buku);
														  end;
		'5'	{Tambah Jumlah Buku ke Sistem}				: begin
															tambah_jumlah_buku(array_buku);
														  end;
		'6' {Lihat Riwayat Peminjaman}					: begin
															riwayat(array_pinjam, array_buku);
														  end;
		'7' {Statistik}									: begin
															statistik(array_user, array_buku);
														  end;
		'8' {Pencarian Anggota}							: begin
															cari_anggota(array_user);
														  end;
		'9'	{Keluar}									: begin
															writeln('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N)?');
															write('> ');
															readln(keluar);
															while (keluar <> 'Y') or (keluar <> 'N') do
															begin
																writeln('Silakan pilih Y atau N');
																write('> ');
																readln(keluar);
															end;
															if (keluar = 'Y') then
															begin
																save_file(array_buku, array_user, array_pinjam, array_kembali, array_hilang);
																stop2 := true;
															end else if (keluar = 'N') then
															begin
																writeln ('Apakah anda yakin ingin keluar tanpa menyimpan file (Y/N)?');
																write('> ');
																readln(konfirmasi);
																while (konfirmasi <> 'Y') or (konfirmasi <> 'N') do
																begin
																	writeln('Silakan pilih Y atau N');
																	write('> ');
																	readln(konfirmasi);
																end;
																if (konfirmasi = 'Y') then
																begin
																	writeln('Penyimpanan file dibatalkan');
																	stop2 := true;
																end else if (konfirmasi = 'N') then
																begin
																	writeln('Kembali ke menu utama');
																end;
															end;
														  end;
			else
			begin
				writeln('Masukkan salah');
			end;
		end;
		until stop2;

	end else if username = 'Pengunjung' then
	begin
		repeat
		writeln('Menu Utama');
		writeln('1. Pencarian Buku Berdasarkan Kategori');
		writeln('2. Pencarian Buku Berdasarkan Tahun Terbit');
		writeln('3. Peminjaman Buku');
		writeln('4. Pengembalian Buku');
		writeln('5. Laporkan Buku yang Hilang');
		writeln('6. Keluar');
		write('> Masukkan pilihan menu: ');
		readln(pil2);

		case pil2 of
		'1' {Pencarian Buku Berdasarkan Kategori}		: begin
															Cari(array_buku);
														  end;
		'2' {Pencarian Buku Berdasarkan Tahun Terbit}	: begin
															CariTahunTerbit(array_buku);
														  end;
		'3' {Peminjaman Buku}							: begin
															pinjam_buku(array_buku, array_pinjam, username);
														  end;
		'4' {Pengembalian Buku}							: begin
															kembalikan_buku(array_buku, array_pinjam, array_kembali, username);
														  end;
		'5' {Laporkan Buku yang Hilang}					: begin
															bukuhilang(array_buku, array_hilang, username);
														  end;
		'6' {Keluar}									: begin
															writeln('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N)?');
															write('> ');
															readln(keluar);
															while (keluar <> 'Y') or (keluar <> 'N') do
															begin
																writeln('Silakan pilih Y atau N');
																write('> ');
																readln(keluar);
															end;
															if (keluar = 'Y') then
															begin
																save_file(array_buku, array_user, array_pinjam, array_kembali, array_hilang);
																stop2 := true;
															end else if (keluar = 'N') then
															begin
																writeln ('Apakah anda yakin ingin keluar tanpa menyimpan file (Y/N)?');
																write('> ');
																readln(konfirmasi);
																while (konfirmasi <> 'Y') or (konfirmasi <> 'N') do
																begin
																	writeln('Silakan pilih Y atau N');
																	write('> ');
																	readln(konfirmasi);
																end;
																if (konfirmasi = 'Y') then
																begin
																	writeln('Penyimpanan file dibatalkan.');
																	stop2 := true;
																end else if (konfirmasi = 'N') then
																begin
																	writeln('Kembali ke menu utama');
																end;
															end;
														  end;
			else
			begin
				writeln('Masukkan salah');
			end;
		end;
		until stop2 = true;
	end;

	writeln('Berhasil keluar dari program. Semoga hari anda menyenangkan!');
end.