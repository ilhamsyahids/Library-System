unit uRiwayat;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini menambahkan menampilkan riwayat, sesuai dengan spesifikasi fitur
  F11 - Melihat riwayat peminjaman }

{ KAMUS }
interface
    
uses
    uTipeData,
    uCariBuku;

procedure riwayat (array_peminjaman : Arr_Peminjaman;
                    array_buku : Arr_Buku);

{ ALGORITMA }
implementation    
procedure riwayat (array_peminjaman : Arr_Peminjaman;
                    array_buku : Arr_Buku);
{ Menampilkan riwayat peminjaman dari user tertentu
  variabel array_buku diisi dengan daftar buku pada program utama
  variabel array_peminjaman diisi dengan daftar peminjaman pada program utama}
var
    N, i : integer;
    username : string;

begin
    N := Length(array_peminjaman);
    write('Masukkan username pengunjung: ');
    readln(username);
    writeln('Riwayat:');

    for i := 0 to N-1 do
    begin
        if (array_peminjaman[i].username = username) then
        begin
            write(FormatDateTime('DD/MM/YYYY', array_peminjaman[i].tanggal_peminjaman));
            write(' | ');
            write(array_peminjaman[i].id_buku);
            write(' | ');
            writeln(cari_buku_dengan_id(array_peminjaman[i].id_buku, array_buku).judul_buku);
        end;
    end;
end;

    
end.