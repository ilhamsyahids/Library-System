unit uTambahJumlahBuku;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini menambahkan prosedur menambah buku, sesuai dengan spesifikasi fitur
  F10 - Melakukan penambahan jumlah buku ke sistem }

{ KAMUS }
interface
uses
    uBuku;

procedure tambah_jumlah_buku (var array_buku : array of Buku);

{ ALGORITMA }
implementation
procedure tambah_jumlah_buku (var array_buku : array of Buku);
{ Melakukan prosedur penambahan buku
  variabel array_buku diisi dengan daftar buku pada program utama. }
var
    buku_yang_ditemukan : Buku;
    id : integer;
    tambahan : integer;
    index : integer;
begin 
    // Blok Input
    write('Masukkan ID Buku: ');
    readln(id);
    write('Masukkan jumlah buku yang ditambahkan: ');
    readln(tambahan);

    // Blok proses (mencari id yang cocok, dan menambahkan jumlah buku)
    buku_yang_ditemukan := cari_buku_dengan_id(id, array_buku, index);
    buku_yang_ditemukan.jumlah_buku := buku_yang_ditemukan.jumlah_buku + tambahan;
    array_buku[index] := buku_yang_ditemukan;
end;    

end.