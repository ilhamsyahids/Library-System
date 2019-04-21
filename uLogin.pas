unit uLogin;
// Dibuat oleh Ilham Syahid S (16518360)
// Unit ini adalah sistem login pengguna
// F02 - Login

// Kamus
interface
    uses uTipeData, uHashing;
    function login(array_user : Arr_User) : String;

// Algoritma
implementation
    function login(array_user : Arr_User) : String;
    // Meminta authorization berupa username dan password dari pengakses
    // variabel array_user diisi dengan daftar user pada program utama

        var
            username : String;
            password : String;
            found : Boolean;
            N,i : Integer;
            
        begin
            write('Masukkan username: ');
            readln(username);
            N := length(array_user);
            found := False;
            
            repeat
                write('Masukkan password: ');
                inputpass(password);
                WriteLn(password);
                i := 0;    

                //Ketika belum ketemu dan pencarian belum selesai
                while not(found) and (i<N) do begin
                    if (array_user[i].Username = username) and (array_user[i].Password = password) then begin
                        WriteLn('Selamat datang ', array_user[i].nama, '!');
                        found := true;
                    end;
                    i := i+1;
                end;

                if not(found) then begin
                    WriteLn('Username / password salah! Silakan coba lagi.');
                    WriteLn();
                    write('Masukkan username: ');
                    readln(username);
                    
                end;
            until (found);
            login := username;
    end;
end.
