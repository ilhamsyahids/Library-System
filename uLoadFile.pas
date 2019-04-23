unit uLoadFile;

interface
	uses uTipeData, uTanggal;
	
	procedure load_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
						 var aKehilangan : Arr_Laporan_Buku_Hilang);
	
implementation
	procedure load_file (var aBuku : Arr_Buku; var aUser : Arr_User; var aPeminjaman : Arr_Peminjaman; var aPengembalian : Arr_Pengembalian;
					     var aKehilangan : Arr_Laporan_Buku_Hilang);
	{ Memuat file-file database kedalam daftar pada memory }
	{ I.S. Diberikan nama file database tiap daftar }
	{ F.S. Database termuat dalam memory }
	var
		f							: Text;
		nama_file					: string;
		CC 							: char;
		input 						: string;
	begin
		{ LOAD FILE BUKU }
		write('Masukkan nama File Buku: ');
		readln(nama_file);
		assign(f, nama_file);
		reset(f);
		SetLength(aBuku, 0);
		while (not(EOF(f))) do
		begin
			SetLength(aBuku, Length(aBuku) + 1);
			{ ID Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aBuku[Length(aBuku)-1].ID_Buku);
			{ Judul Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aBuku[Length(aBuku)-1].Judul_Buku := input;
			{ Author }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aBuku[Length(aBuku)-1].Author := input;
			{ Jumlah Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aBuku[Length(aBuku)-1].Jumlah_Buku);
			{ Tahun Penerbit }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aBuku[Length(aBuku)-1].Tahun_Penerbit);
			{ Kategori }
			input := '';
			Read (f, CC);
			while (CC <> Chr(10)) and (CC <> Chr(13)) do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aBuku[Length(aBuku)-1].Kategori := input;
			Read(f, CC);			{ Skip line ending }
			if (CC = Chr(13)) then
				Read(f, CC);		{ Skip CRLF (Windows), else LF saja (Unix) }
		end;
		close(f);
						
		{ LOAD FILE USER }
		write('Masukkan nama File User: ');
		readln(nama_file);
		assign(f, nama_file);
		reset(f);
		SetLength(aUser, 0);
		while (not(EOF(f))) do
		begin
			SetLength(aUser, Length(aUser) + 1);
			{ Nama }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aUser[Length(aUser)-1].Nama := input;
			{ Alamat }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aUser[Length(aUser)-1].Alamat := input;
			{ Username }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aUser[Length(aUser)-1].Username := input;
			{ Password }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aUser[Length(aUser)-1].Password := input;
			{ Role }
			input := '';
			Read (f, CC);
			while (CC <> Chr(10)) and (CC <> Chr(13)) do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aUser[Length(aUser)-1].Role := input;
			
			Read(f, CC);			{ Skip line ending }
			if (CC = Chr(13)) then
				Read(f, CC);		{ Skip CRLF (Windows), else LF saja (Unix) }
		end;
		close(f);

		{ LOAD FILE PEMINJAMAN }
		write('Masukkan nama File Peminjaman: ');
		readln(nama_file);
		assign(f, nama_file);
		reset(f);
		SetLength(aPeminjaman, 0);
		while (not(EOF(f))) do
		begin
			SetLength(aPeminjaman, Length(aPeminjaman) + 1);
			{ Nama }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPeminjaman[Length(aPeminjaman)-1].Username := input;
			{ ID Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aPeminjaman[Length(aPeminjaman)-1].ID_Buku);
			{ Tanggal Peminjaman }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPeminjaman[Length(aPeminjaman)-1].Tanggal_Peminjaman := StringToTanggal(input);
			{ Tanggal Batas Penegembalian }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPeminjaman[Length(aPeminjaman)-1].Tanggal_Batas_Pengembalian := StringToTanggal(input);
			{ Status Pengembalian }
			input := '';
			Read (f, CC);
			while (CC <> Chr(10)) and (CC <> Chr(13)) do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPeminjaman[Length(aPeminjaman)-1].Status_Pengembalian := input;
			
			Read(f, CC);			{ Skip line ending }
			if (CC = Chr(13)) then
				Read(f, CC);		{ Skip CRLF (Windows), else LF saja (Unix) }
		end;
		close(f);
		
		{ LOAD FILE PENGEMBALIAN }
		write('Masukkan nama File Pengembalian: ');
		readln(nama_file);
		assign(f, nama_file);
		reset(f);
		SetLength(aPengembalian, 0);
		while (not(EOF(f))) do
		begin
			SetLength(aPengembalian, Length(aPengembalian) + 1);
			{ Username }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPengembalian[Length(aPengembalian)-1].Username := input;
			{ ID Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aPengembalian[Length(aPengembalian)-1].ID_Buku);
			{ Tanggal Peminjaman }
			input := '';
			Read (f, CC);
			while (CC <> Chr(10)) and (CC <> Chr(13)) do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aPengembalian[Length(aPengembalian)-1].Tanggal_Pengembalian := StringToTanggal(input);
			
			Read(f, CC);			{ Skip line ending }
			if (CC = Chr(13)) then
				Read(f, CC);		{ Skip CRLF (Windows), else LF saja (Unix) }
		end;
		close(f);
		
		{ LOAD FILE KEHILANGAN }
		write('Masukkan nama File Buku Hilang: ');
		readln(nama_file);
		assign(f, nama_file);
		reset(f);
		SetLength(aKehilangan, 0);
		while (not(EOF(f))) do
		begin
			SetLength(aKehilangan, Length(aKehilangan) + 1);
			{ Username }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aKehilangan[Length(aKehilangan)-1].Username := input;
			{ ID Buku }
			input := '';
			Read (f, CC);
			while (CC <> ',') do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			Val(input, aKehilangan[Length(aKehilangan)-1].ID_Buku_Hilang);
			{ Tanggal Peminjaman }
			input := '';
			Read (f, CC);
			while (CC <> Chr(10)) and (CC <> Chr(13)) do 
			begin
				input := input + CC;
				Read(f, CC);
			end;
			aKehilangan[Length(aKehilangan)-1].Tanggal_Laporan := StringToTanggal(input);
			
			Read(f, CC);			{ Skip line ending }
			if (CC = Chr(13)) then
				Read(f, CC);		{ Skip CRLF (Windows), else LF saja (Unix) }
		end;
		close(f);

		writeln(' ');
		writeln('File perpustakaan berhasil dimuat!');
	end;
end.
