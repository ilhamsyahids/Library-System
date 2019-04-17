unit uStatistik;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini menambahkan menampilkan statistik pengguna dan buku, 
  sesuai dengan spesifikasi fitur F12 - Statistik }

{ KAMUS }
interface   
uses
    uTipeData;

procedure statistik(array_user : Arr_User; array_buku : Arr_Buku);

{ ALGORITMA }
implementation
procedure statistik(array_user : Arr_User; array_buku : Arr_Buku);
{ Menampilkan statistik user dan buku berupa jumlah entri tiap kategori, serta totalnya 
  variabel array_user diisi dengan daftar pengguna pada program utama,
  variabel array_buku diisi dengan daftar buku pada program utama}
var
    N_user, N_buku, i : integer;
    N_admin, N_pengunjung : integer;
    N_sastra, N_sains, N_manga, N_sejarah, N_programming : integer;
begin
    { Menghitung jumlah per role user}
    N_user := Length(array_user);
    N_admin := 0; 
    N_pengunjung := 0;
    for i := 0 to N_user - 1 do
    begin
        if (array_user[i].role = 'Admin') then
        begin
            N_admin := N_admin + 1;
        end
        else { array_user[i].role = pengunjung }
        begin
            N_pengunjung := N_pengunjung + 1;
        end;
    end;

    { Menghitung jumlah per kategori user}
    N_buku := Length(array_buku);
    N_sastra := 0;
    N_sains := 0;
    N_manga := 0;
    N_sejarah := 0;
    N_programming := 0;
    for i := 0 to N_buku - 1 do
    begin
        if (array_buku[i].kategori = 'sastra') then
        begin
            N_sastra := N_sastra + array_buku[i].jumlah_buku;
        end
        else if (array_buku[i].kategori = 'sains') then
        begin
            N_sains := N_sains + array_buku[i].jumlah_buku;
        end
        else if (array_buku[i].kategori = 'manga') then
        begin
            N_manga := N_manga + array_buku[i].jumlah_buku;
        end
        else if (array_buku[i].kategori = 'sejarah') then
        begin
            N_sejarah := N_sejarah + array_buku[i].jumlah_buku;
        end
        else { array_user[i].kategori = programming }
        begin
            N_programming := N_programming + array_buku[i].jumlah_buku;
        end;
    end;

    { Output data statistik }
    writeln('Pengguna:');
    write('Admin | ');
    writeln(N_admin);
    write('Pengunjung | ');
    writeln(N_pengunjung);
    write('Total | ');
    writeln(N_user);

    writeln('Buku:');
    write('sastra | ');
    writeln(N_sastra);
    write('sains | ');
    writeln(N_sains);
    write('manga | ');
    writeln(N_manga);
    write('sejarah | ');
    writeln(N_sejarah);
    write('programming | ');
    writeln(N_programming);
    write('Total | ');
    writeln(N_sastra + N_sains + N_manga + N_sejarah + N_programming);

end;
    
end.