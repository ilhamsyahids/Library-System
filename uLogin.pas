unit uLogin;
// Dibuat oleh Ilham Syahid S (16518360)
// Unit ini adalah sistem login pengguna
// F02 - Login

// Kamus
interface
    uses uTipeData, uHashing, uSHA3;
    procedure login(array_user : Arr_User; var LoginUser : User);

// Algoritma
implementation
    procedure login(array_user : Arr_User; var LoginUser : User);
    // Meminta authorization berupa username dan password dari pengakses
    // variabel array_user diisi dengan daftar user pada program utama

        var
            username    : String;
            password    : String;
            found       : Boolean;
            N,i         : Integer;
            
        begin
            // Input username
            write('Masukkan username: ');
            readln(username);
            N := length(array_user);
            found := False;
            
            // Skema perulangan
            repeat
                // Input password
                write('Masukkan password: ');
                inputpass(password);
                i := 0;    

                //Ketika belum ketemu dan pencarian belum selesai
                while not(found) and (i<N) do begin
                    if (array_user[i].Username = username) and (array_user[i].Password = Generate224(password)) then begin
                        WriteLn('Selamat datang ', array_user[i].nama, '!');
                        found := true;
                    end
                    else
                        i := i+1;
                end;

                // Validasi
                if not(found) then begin
                    WriteLn('Username / password salah! Silakan coba lagi.');
                    WriteLn();
                    write('Masukkan username: ');
                    readln(username);
                    
                end;
            until (found);

            // Inisiasi user ke LoginUser
            LoginUser := array_user[i];
    end;
end.
