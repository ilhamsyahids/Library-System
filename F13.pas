unit F13;

interface
	uses ini_header;
	
	procedure load_file (var tBuku : tabBuku; var tUser : tabUser; var tPeminjaman : tabPeminjaman; var tPengembalian : tabPengembalian;
						 var tKehilangan : tabKehilangan);
	
implementation
	procedure load_file (var tBuku : tabBuku; var tUser : tabUser; var tPeminjaman : tabPeminjaman; var tPengembalian : tabPengembalian;
					     var tKehilangan : tabKehilangan);
	var
		f			: TextFile;
		nama_file	: string;
		space		: string;
	begin
		write('Masukkan nama File Buku: ');
		readln(nama_file);
		case nama_file of
			'buku.csv' :   begin
								assign(f, 'buku.csv');
								reset(f);
								tBuku.neff := 0;
								if EOF(f) then
								begin
									writeln('File kosong.');
								end else
								begin
									while (not(EOF(f))) do
									begin
										tBuku.neff := tBuku.neff + 1;
										readln(f, tBuku.tab[tBuku.neff].ID_Buku);
										readln(f, tBuku.tab[tBuku.neff].Judul_Buku);
										readln(f, tBuku.tab[tBuku.neff].Author);
										readln(f, tBuku.tab[tBuku.neff].Jumlah_Buku);
										readln(f, tBuku.tab[tBuku.neff].Tahun_Penerbit);
										readln(f, tBuku.tab[tBuku.neff].Kategori);
										readln(f, space);
									end;
								end;
								close(f);
							end;
		end;
						
		write('Masukkan nama File User: ');
		readln(nama_file);
		case nama_file of
			'user.csv' :	begin
								assign(f, 'user.csv');
								reset(f);
								tUser.neff := 0;
								if EOF(f) then
								begin
									writeln('File kosong.');
								end else
								begin
									while (not(EOF(f))) do
									begin
										tUser.neff := tUser.neff + 1;
										readln(f, tUser.tab[tUser.neff].Nama);
										readln(f, tUser.tab[tUser.neff].Alamat);
										readln(f, tUser.tab[tUser.neff].Username);
										readln(f, tUser.tab[tUser.neff].Password);
										readln(f, tUser.tab[tUser.neff].Role);
										readln(f, space);
									end;
								end;
								close(f);
							 end;
		end;
		
		write('Masukkan nama File Peminjaman: ');
		read(nama_file);
		case nama_file of
			'peminjaman.csv' :	begin
									assign(f, 'peminjaman.csv');
									reset(f);
									tPeminjaman.neff := 0;
									if EOF(f) then
									begin
										writeln('File kosong.');
									end else
									begin
										while (not(EOF(f))) do
										begin
											tPeminjaman.neff := tPeminjaman.neff + 1;
											readln(f, tPeminjaman.tab[tPeminjaman.neff].Username);
											readln(f, tPeminjaman.tab[tPeminjaman.neff].ID_Buku);
											readln(f, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Peminjaman.hari, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Peminjaman.bulan, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Peminjaman.tahun);
											readln(f, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Batas_Pengembalian.hari, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Batas_Pengembalian.bulan, tPeminjaman.tab[tPeminjaman.neff].Tanggal_Batas_Pengembalian.tahun);
											readln(f, tPeminjaman.tab[tPeminjaman.neff].Status_Pengembalian);
											readln(f, space);
										end;
									end;
									close(f);
								 end;
		end;
		
		write('Masukkan nama File Pengembalian: ');
		readln(nama_file);
		case nama_file of
			'pengembalian.csv' :	begin
										assign(f, 'pengembalian.csv');
										reset(f);
										tPengembalian.neff := 0;
										if EOF(f) then
										begin
											writeln('File kosong.');
										end else
										begin
											while (not(EOF(f))) do
											begin
												tPengembalian.neff := tPengembalian.neff + 1;
												readln(f, tPengembalian.tab[tPengembalian.neff].Username);
												readln(f, tPengembalian.tab[tPengembalian.neff].ID_Buku);
												readln(f, tPengembalian.tab[tPengembalian.neff].Tanggal_Pengembalian.hari, tPengembalian.tab[tPengembalian.neff].Tanggal_Pengembalian.bulan, tPengembalian.tab[tPengembalian.neff].Tanggal_Pengembalian.tahun);
												readln(f, space);
											end;
										end;
										close(f);
									 end;
		end;
		
		write('Masukkan nama File Buku Hilang: ');
		readln(nama_file);
		case nama_file of
			'kehilangan.csv' :	begin
									assign(f, 'kehilangan.csv');
									reset(f);
									tKehilangan.neff := 0;
									if EOF(f) then
									begin
										writeln('File kosong.');
									end else
									begin
										while (not(EOF(f))) do
										begin
											tKehilangan.neff := tKehilangan.neff + 1;
											readln(f, tKehilangan.tab[tKehilangan.neff].Username);
											readln(f, tKehilangan.tab[tKehilangan.neff].ID_Buku_Hilang);
											readln(f, tKehilangan.tab[tKehilangan.neff].Tanggal_Laporan.hari, tKehilangan.tab[tKehilangan.neff].Tanggal_Laporan.bulan, tKehilangan.tab[tKehilangan.neff].Tanggal_Laporan.tahun);
											readln(f, space);
										end;
									end;
									close(f);
								 end;
		end;
		writeln(' ');
		write('File perpustakaan berhasil dimuat!');
	end;
end.
