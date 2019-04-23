unit uCariAnggota;


// KAMUS
interface
	uses uTipeData;
	
	procedure cari_anggota (var cariUser : Arr_User);
	{ Mencari anggota dengan username tertentu }
	{ I.S. : Username anggota } 
	{ F.S. : Nama dan Alamat anggota}

// ALGORITMA
implementation
	procedure cari_anggota (var cariUser : Arr_User);
	{ Mencari data anggota dari usernamenya }
	{ I.S. Admin menginput username yang datanya ingin dicari }
	{ F.S. Ditampilkaan nama dan alamat user }
	var
		nama_user			: string;
		i, n				: integer;
		ada : Boolean;
	
	begin
		write('Masukkan username: ');
		readln(nama_user);
		n := length(cariUser) - 1;
		ada := false;
		for i:=0 to n do begin
				if (nama_user = cariUser[i].Username) then begin
					writeln('Nama Anggota: ', cariUser[i].Nama);
					writeln('Alamat anggota: ', cariUser[i].Alamat);
					ada := True;
				end;
		end;

		if not(ada) then begin
			writeln('Anggota tidak ditemukan.');
		end;
	end;
end.
