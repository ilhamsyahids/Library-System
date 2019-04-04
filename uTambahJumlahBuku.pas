unit uTambahJumlahBuku;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini menambahkan prosedur menambah buku, sesuai dengan spesifikasi fitur
  F10 - Melakukan penambahan jumlah buku ke sistem }

{ KAMUS }
interface
uses
    uTipeData,
    uCariBuku;

procedure tambah_jumlah_buku (var array_buku : Arr_Buku);

{ ALGORITMA }
implementation
procedure tambah_jumlah_buku (var array_buku : Arr_Buku);
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

    // Blok output
    writeln('');
    write('Pembaharuan jumlah buku berhasil dilakukan, total buku ');
    write(buku_yang_ditemukan.judul_buku);
    write(' di perpustakaan menjadi ');
    writeln(buku_yang_ditemukan.jumlah_buku);
end;    

end.