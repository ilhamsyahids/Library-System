unit uSaveFile;

interface
	uses uTipeData, uTanggal;
	
	procedure save_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
						 var aKehilangan : Arr_Laporan_Buku_Hilang);
						 
implementation
	procedure save_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
						 var aKehilangan : Arr_Laporan_Buku_Hilang);
	var
		f						: text;
		nama_file					: string;
		data, data1, data2, data3	: string;
		i, n						: integer;
	begin
		write('Masukkan nama File Buku: ');
		readln(nama_file);
		assign(f, nama_file);
		rewrite(f);
		n := length(aBuku) - 1;
		for i:=0 to n do
		begin
			str(aBuku[i].ID_Buku,data1); str(aBuku[i].Jumlah_Buku,data2); str(aBuku[i].Tahun_Penerbit,data3);
			data := data1 + ',' + aBuku[i].Judul_Buku + ',' + aBuku[i].Author + ',' + data2 + ',' + data3 + ',' + aBuku[i].Kategori;
			writeln(f,data);
		end;
		close(f);
		
		write('Masukkan nama File User: ');
		readln(nama_file);
		assign(f, nama_file);
		rewrite(f);
		n := length(aUser) - 1;
		for i:=0 to n do
		begin
			data := aUser[i].Nama + ',' + aUser[i].Alamat + ',' + aUser[i].Username + ',' + aUser[i].Password + ',' + aUser[i].Role;
			writeln(f,data);
		end;
		close(f);

		write('Masukkan nama File Peminjaman: ');
		readln(nama_file);
		assign(f, nama_file);
		rewrite(f);
		n := length(aPeminjaman) - 1;
		for i:=0 to n do
		begin
			str(aPeminjaman[i].ID_Buku,data1);
			data2 := TanggalToString(aPeminjaman[i].Tanggal_Peminjaman); data3 := TanggalToString(aPeminjaman[i].Tanggal_Batas_Pengembalian);
			data := aPeminjaman[i].Username + ',' + data1 + ',' + data2 + ',' + data3 + ',' + aPeminjaman[i].Status_Pengembalian;
			writeln(f,data);
		end;
		close(f);
		
		write('Masukkan nama File Pengembalian: ');
		readln(nama_file);
		assign(f, nama_file);
		rewrite(f);
		n := length(aPengembalian) - 1;
		for i:=0 to n do
		begin
			str(aPengembalian[i].ID_Buku,data1);
			data2 := TanggalToString(aPengembalian[i].Tanggal_Pengembalian);
			data := aPengembalian[i].Username + ',' + data1 + ',' + data2;
			writeln(f,data);
		end;
		close(f);
		
		write('Masukkan nama File Buku Hilang: ');
		readln(nama_file);
		assign(f, nama_file);
		rewrite(f);
		n := length(aKehilangan) - 1;
		for i:=0 to n do
		begin
			str(aKehilangan[i].ID_Buku_Hilang,data1);
			data2 := TanggalToString(aKehilangan[i].Tanggal_Laporan);
			data := aKehilangan[i].Username + ',' + data1 + ',' + data2;
			writeln(f,data);
		end;
		close(f);
		writeln(' ');
		writeln('Data berhasil disimpan!');
	end;
end.
