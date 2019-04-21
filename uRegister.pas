unit uRegister;
// Dibuat oleh Ilham Syahid S (16518360)
// Unit ini menampilkan pendaftaran akun
// F01 - Register

// Kamus
interface
    uses uTipeData, uHashing, uSHA3;
    procedure register(var array_user : Arr_User ); 

// Algoritma
implementation
    procedure register(var array_user : Arr_User); 
    // Meminta nama, alamat, username dan password pengguna baru
    // variabel array_user diisi dengan daftar user

        var 
            nama, alamat, username, password : string;
            N : Integer;
        begin
            // CLRSCR();
            // echo 'aa';
            // Ambil data user
            Write('Masukkan nama pengunjung: '); readln(nama);
            write('Masukkan alamat pengunjung: '); readln(alamat);
            write('Masukkan username pengunjung: '); readln(username);
            write('Masukkan password pengunjung: '); Inputpass(password);


            // Pemasukkan data ke tabel
            N := length(array_user);
            SetLength(array_user, N+1);
            array_user[N].Nama := nama;
            array_user[N].Alamat := alamat;
            array_user[N].Username := username;
            array_user[N].Password := Generate224(password);
            
            WriteLn();
            writeln('Pengunjung ', array_user[N].Nama, ' berhasil terdaftar sebagai user.');
            WriteLn();
        end;
end.