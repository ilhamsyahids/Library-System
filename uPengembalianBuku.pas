{16518115/Muhammad Firas}
{unit pengembalian buku}

unit uPengembalianBuku;

interface

uses
    uTanggal,
    uTipeData,
    uCariBuku;

procedure kembalikan_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman; var array_kembali : Arr_Pengembalian; nama_user : string);


implementation
procedure kembalikan_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman; var array_kembali : Arr_Pengembalian; nama_user : string);


var
    buku_yang_ditemukan : Buku;
    id : integer;
    idx : integer;
    string_tanggalkembali : string;
    buku_dikembalikan : Pengembalian;
    i : Integer;
    found : Boolean;

begin 
    // Blok Input
    write('Masukkan id buku yang dikembalikan: ');
    readln(id);

    // Blok proses (mencari id yang cocok, dan menambahkan jumlah buku)
    buku_yang_ditemukan := cari_buku_dengan_id(id, array_buku, idx);
    buku_yang_ditemukan.jumlah_buku := buku_yang_ditemukan.jumlah_buku + 1;
    array_buku[idx] := buku_yang_ditemukan;

    found := False;
    i := 0;
    while (i < Length(array_pinjam)) and (not (found)) do
    begin
        if (array_pinjam[i].Username = nama_user) and (array_pinjam[i].ID_Buku = id) then
        begin
            found := True;
            idx := i;
            array_pinjam[i].Status_Pengembalian := 'sudah';
        end
        else
        begin
            i := i + 1;
        end;
    end;

    // Blok output
    writeln('Data peminjaman:');
    writeln('Username: ', nama_user);
    writeln('Judul buku: ', buku_yang_ditemukan.judul_buku);
    writeln('Tanggal peminjaman: ', TanggalToString(array_pinjam[idx].Tanggal_Peminjaman));
    writeln('Tanggal batas pengembalian: ', TanggalToString(array_pinjam[idx].Tanggal_Batas_Pengembalian));
    writeln();
    write('Masukkan tanggal hari ini: ');
    readln(string_tanggalkembali);

    if (IsLebihTelat(StringToTanggal(string_tanggalkembali), array_pinjam[idx].Tanggal_Batas_Pengembalian)) then
        WriteLn('Anda terlambat mengembalikan buku')
    else
        writeln('Terima kasih sudah meminjam.');

    buku_dikembalikan.Username := nama_user;
    buku_dikembalikan.ID_Buku := id;
    buku_dikembalikan.Tanggal_Pengembalian := StringToTanggal (string_tanggalkembali);

    SetLength(array_kembali, Length(array_kembali)+1);
    array_kembali[High(array_kembali)] := buku_dikembalikan;

end;    

end.