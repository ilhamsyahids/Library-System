{16518115/Muhammad Firas}
{unit pengembalian buku}

unit uPengembalianBuku;

interface

uses
    uTanggal,
    uTipeData,
    uCariBuku;

procedure kembalikan_buku (var array_buku : Arr_Buku; array_kembali : Arr_Pengembalian; nama_user : string);


implementation
procedure kembalikan_buku (var array_buku : Arr_Buku; array_kembali : Arr_Pengembalian; nama_user : string);


var
    buku_yang_ditemukan : Buku;
    id : integer;
    tanggalpinjam : Tanggal;
    tanggalkembali : Tanggal;
    index : integer;
    string_tanggalkembali : string;
    string_tanggalpinjam : string;
    buku_dikembalikan : Pengembalian;

begin 
    // Blok Input
    write('Masukkan id buku yang dikembalikan: ');
    readln(id);

    // Blok proses (mencari id yang cocok, dan menambahkan jumlah buku)
    buku_yang_ditemukan := cari_buku_dengan_id(id, array_buku, index);
    buku_yang_ditemukan.jumlah_buku := buku_yang_ditemukan.jumlah_buku + 1;
    array_buku[index] := buku_yang_ditemukan;

    TanggaltoString (tanggalpinjam);

    // Blok output
    writeln('Data peminjaman:');
    writeln('Username: ', nama_user);
    writeln('Judul buku: ', buku_yang_ditemukan.judul_buku);
    writeln('Tanggal peminjaman: ', string_tanggalpinjam);
    writeln('Tanggal batas pengembalian: ', );
    writeln();
    write('Masukkan tanggal hari ini: ');
    readln(string_tanggalkembali);

    StringToTanggal (string_tanggalkembali);

    writeln('Terima kasih sudah meminjam.');

    buku_dikembalikan.Username := nama_user;
    buku_dikembalikan.ID_Buku := id;
    buku_dikembalikan.Tanggal_Pengembalian := tanggalkembali;

    SetLength(array_kembali, Length(array_kembali)+1);
    array_kembali[High(array_kembali)] := buku_dikembalikan;

end;    

end.