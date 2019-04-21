{16518115/Muhammad Firas}
{unit peminjaman buku}

unit uPinjamBuku;

interface

uses
    uTanggal,
    uTipeData,
    uCariBuku;

procedure pinjam_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman ; nama_user : string);


implementation
procedure pinjam_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman ; nama_user : string);


var
    buku_yang_ditemukan : Buku;
    id : integer;
    tanggal1 : Tanggal;
    index : integer;
    stringtanggal : string;
    pinjam : Peminjaman;
begin 
    // Blok Input
    write('Masukkan id buku yang ingin dipinjam: ');
    readln(id);
    write('Masukkan tanggal hari ini: ');
    readln(stringtanggal);

    // Blok proses (mencari id yang cocok, dan menambahkan jumlah buku)
    buku_yang_ditemukan := cari_buku_dengan_id(id, array_buku, index);
    if (buku_yang_ditemukan.jumlah_buku > 0) then begin
        tanggal1 := StringToTanggal(stringtanggal);

        pinjam.Username := nama_user;
        pinjam.ID_buku := id;
        pinjam.Tanggal_Peminjaman := StringToTanggal (stringtanggal);
        pinjam.Tanggal_Batas_Pengembalian := TambahHari(tanggal1, 7);
        pinjam.Status_Pengembalian := 'belum';

        SetLength(array_pinjam, Length(array_pinjam)+1);
        array_pinjam[High(array_pinjam)] := pinjam;
        
        buku_yang_ditemukan.jumlah_buku := buku_yang_ditemukan.jumlah_buku - 1;
        array_buku[index] := buku_yang_ditemukan;

        // Blok output
        writeln('Buku ', buku_yang_ditemukan.judul_buku, ' berhasil dipinjam!');
        writeln('Tersisa ', buku_yang_ditemukan.jumlah_buku, ' buku ', buku_yang_ditemukan.judul_buku);
    end else begin
        writeln('Buku ', buku_yang_ditemukan.judul_buku, ' sedang habis!');
        writeln('Coba lain kali.');
    end;
end;    

end.