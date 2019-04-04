unit uLogin;
// Dibuat oleh Ilham Syahid S (16518360)
// Unit ini adalah sistem login pengguna
// F02 - Login

// Kamus
interface
    uses uTipeData;
    procedure login(array_user : Arr_User );

// Algoritma
implementation
    procedure login(array_user : Arr_User);
    // Meminta authorization berupa username dan password dari pengakses
    // variabel array_user diisi dengan daftar user pada program utama

        var
            username : String;
            password : String;
            found,wrong : Boolean;
            N,i : Integer;
            
        begin
            write('Masukkan username: ');
            readln(username);
            N := length(array_user);
            found := False;
            wrong := False;
            
            repeat
                write('Masukkan password: ');
                readln(password);
                i := 0;    
                while not(found) and (i<N) do //Ketika belum ketemu dan pencarian belum selesai
                begin
                    if (array_user[i].username = username) and (array_user[i].password = password) then begin
                        WriteLn('Selamat datang ', array_user[i].nama, '!');
                        found := true;
                    end;
                    i := i+1;
                end;

                if not(found) and not(wrong) then begin
                    WriteLn('Username / password salah! Silakan coba lagi.');
                    WriteLn();
                    write('Masukkan username: ');
                    readln(username);
                    
                end;
            until (found);
    end;
end.