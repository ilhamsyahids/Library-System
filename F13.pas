unit F13;

interface
	uses uTipeData, uTanggal;
	
	procedure load_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
						 var aKehilangan : Arr_Laporan_Buku_Hilang);
	
implementation
	procedure load_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
					     var aKehilangan : Arr_Laporan_Buku_Hilang);
	var
		f							: Text;
		nama_file					: string;
		data, data1, data2, data3	: string;
		n							: integer;
	begin
		write('Masukkan nama File Buku: ');
		readln(nama_file);
		case nama_file of
			'buku.csv' :   begin
								assign(f, 'buku.csv');
								reset(f);
								n := 0;
								if EOF(f) then
								begin
									writeln('File kosong.');
								end else
								begin
									while (not(EOF(f))) do
									begin
										n := n + 1;
										str(aBuku[n].ID_Buku,data1); str(aBuku[n].Jumlah_Buku,data2); str(aBuku[n].Tahun_Penerbit,data3);
										data := data1 + ',' + aBuku[n].Judul_Buku + ',' + aBuku[n].Author + ',' + data2 + ',' + data3 + ',' + aBuku[n].Kategori;
										readln(f,data);
									end;
									SetLength(aBuku,n);
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
								n := 0;
								if EOF(f) then
								begin
									writeln('File kosong.');
								end else
								begin
									while (not(EOF(f))) do
									begin
										n := n + 1;
										data := aUser[n].Nama + ',' + aUser[n].Alamat + ',' + aUser[n].Username + ',' + aUser[n].Password + ',' + aUser[n].Role;
										readln(f,data);
									end;
									SetLength(aUser,n);
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
									n := 0;
									if EOF(f) then
									begin
										writeln('File kosong.');
									end else
									begin
										while (not(EOF(f))) do
										begin
											n := n + 1;
											str(aPeminjaman[n].ID_Buku,data1);
											aPeminjaman[n].Tanggal_Peminjaman := StringToTanggal(data2); aPeminjaman[n].Tanggal_Batas_Pengembalian := StringToTanggal(data3);
											data := aPeminjaman[n].Username + ',' + data1 + ',' + data2 + ',' + data3 + aPeminjaman[n].Status_Pengembalian;
											readln(f,data);
										end;
										SetLength(aPeminjaman,n);
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
										n := 0;
										if EOF(f) then
										begin
											writeln('File kosong.');
										end else
										begin
											while (not(EOF(f))) do
											begin
												n := n + 1;
												str(aPengembalian[n].ID_Buku,data1);
												aPengembalian[n].Tanggal_Pengembalian := StringToTanggal(data2);
												data := aPengembalian[n].Username + ',' + data1 + ',' + data2;
												readln(f,data);
											end;
											SetLength(aPengembalian,n);
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
									n := 0;
									if EOF(f) then
									begin
										writeln('File kosong.');
									end else
									begin
										while (not(EOF(f))) do
										begin
											n := n + 1;
											str(aKehilangan[n].ID_Buku_Hilang,data1);
											aKehilangan[n].Tanggal_Laporan := StringToTanggal(data2);
											data := aKehilangan[n].Username + ',' + data1 + ',' + data2;
											readln(f,data);
										end;
										SetLength(aKehilangan,n);
									end;
									close(f);
								 end;
		end;
		writeln(' ');
		write('File perpustakaan berhasil dimuat!');
	end;
end.
