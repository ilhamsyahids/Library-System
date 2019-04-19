unit F15;

interface
	uses uTipeData, F13;
	
	procedure cari_anggota (var cariUser : Arr_User);

implementation
	procedure cari_anggota (var cariUser : Arr_User);
	
	var
		nama_user					: string;
		i, n, j						: integer;
		result, result1, result2	: integer;
	
	begin
		write('Masukkan username: ');
		readln(nama_user);
		n := length(cariUser) - 1;
		result1 := 0;
		result2 := 0;
		for i:=0 to n do
		begin
			if (nama_user = cariUser[i].Username) then
			begin
				result := 0;
			end else
			begin
				result := 1;
			end;
			
			if (result = 0) then
			begin
				result1 := 1;
				j := i;
			end else
			begin
				result2 := 1;
			end;
		end;
		
		if (result1 = 1) and (result2 = 1) then
		begin
			writeln('Nama Anggota: ', cariUser[j].Nama);
			writeln('Alamat anggota: ', cariUser[j].Alamat);
		end else
		begin
			writeln('Anggota tidak ditemukan.');
		end;
	end;
end.
