unit F14;

interface
	uses ini_header;
	
	procedure save_file (var tBuku : tabBuku; var tUser : tabUser; var tPeminjaman : tabPeminjaman; var tPengembalian : tabPengembalian;
						 var tKehilangan : tabKehilangan);
						 
implementation
	procedure save_file (var tBuku : tabBuku; var tUser : tabUser; var tPeminjaman : tabPeminjaman; var tPengembalian : tabPengembalian;
						 var tKehilangan : tabKehilangan);
	var
		f			: TextFile;
		nama_file	: string;
		space		: string;
		i			: integer;
	begin
		write('Masukkan nama File Buku: ');
		readln(nama_file);
		case nama_file of
			'buku.csv' :	begin
								assign(f, 'buku.csv');
								rewrite(f);
								for i:=1 to tBuku.neff do
								begin
									writeln(f, tBuku.tab[i].ID_Buku);
									writeln(f, tBuku.tab[i].Judul_Buku);
									writeln(f, tBuku.tab[i].Author);
									writeln(f, tBuku.tab[i].Jumlah_Buku);
									writeln(f, tBuku.tab[i].Tahun_Penerbit);
									writeln(f, tBuku.tab[i].Kategori);
									writeln(f, space);
								end;
								close(f);
							 end;
		end;
		
		write('Masukkan nama File User: ');
		readln(nama_file);
		case nama_file of
			'user.csv' :	begin
								assign(f, 'user.csv');
								rewrite(f);
								for i:=1 to tUser.neff do
								begin
									writeln(f, tUser.tab[i].Nama);
									writeln(f, tUser.tab[i].Alamat);
									writeln(f, tUser.tab[i].Username);
									writeln(f, tUser.tab[i].Password);
									writeln(f, tUser.tab[i].Role);
									writeln(f, space);
								end;
								close(f);
							 end;
		end;

		write('Masukkan nama File Peminjaman: ');
		read(nama_file);
		case nama_file of
			'peminjaman.csv' :	begin
									assign(f, 'peminjaman.csv');
									rewrite(f);
									for i:=1 to tPeminjaman.neff do
									begin
										writeln(f, tPeminjaman.tab[i].Username);
										writeln(f, tPeminjaman.tab[i].ID_Buku);
										writeln(f, tPeminjaman.tab[i].Tanggal_Peminjaman.hari, tPeminjaman.tab[i].Tanggal_Peminjaman.bulan, tPeminjaman.tab[i].Tanggal_Peminjaman.tahun);
										writeln(f, tPeminjaman.tab[i].Tanggal_Batas_Pengembalian.hari, tPeminjaman.tab[i].Tanggal_Batas_Pengembalian.bulan, tPeminjaman.tab[i].Tanggal_Batas_Pengembalian.tahun);
										writeln(f, tPeminjaman.tab[i].Status_Pengembalian);
										writeln(f, space);
									end;
									close(f);
								 end;
		end;
		
		write('Masukkan nama File Pengembalian: ');
		readln(nama_file);
		case nama_file of
			'pengembalian.csv' :	begin
										assign(f, 'pengembalian.csv');
										rewrite(f);
										for i:=1 to tPengembalian.neff do
										begin
											writeln(f, tPengembalian.tab[i].Username);
											writeln(f, tPengembalian.tab[i].ID_Buku);
											writeln(f, tPengembalian.tab[i].Tanggal_Pengembalian.hari, tPengembalian.tab[i].Tanggal_Pengembalian.bulan, tPengembalian.tab[i].Tanggal_Pengembalian.tahun);
											writeln(f, space);
										end;
										close(f);
									 end;
		end;
		
		write('Masukkan nama File Buku Hilang: ');
		readln(nama_file);
		case nama_file of
			'kehilangan.csv' :	begin
									assign(f, 'kehilangan.csv');
									rewrite(f);
									for i:=1 to tKehilangan.neff do
									begin
										readln(f, tKehilangan.tab[i].Username);
										readln(f, tKehilangan.tab[i].ID_Buku_Hilang);
										readln(f, tKehilangan.tab[i].Tanggal_Laporan.hari, tKehilangan.tab[i].Tanggal_Laporan.bulan, tKehilangan.tab[i].Tanggal_Laporan.tahun);
										readln(f, space);
									end;
									close(f);
								 end;
		end;
		writeln(' ');
		write('Data berhasil disimpan!');
	end;
end.
