unit uPinjamBuku;
{ Dibuat oleh Muhammad Firas (16518115)
  Unit ini meminjam buku sesuai dengan id buku yang dimasukkan pengguna
  F05 - Peminjaman Buku }

{ KAMUS }
interface

uses
    uTanggal,
    uTipeData,
    uCariBuku;

procedure pinjam_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman ; nama_user : string);

{ AlGORITMA }
implementation
procedure pinjam_buku (var array_buku : Arr_Buku; var array_pinjam : Arr_Peminjaman ; nama_user : string);
{ Meminjam buku dengan memasukkan id dan tanggal buku tersebut dipinjam
  variabel array_buku diisi dengan daftar buku pada program utama
  variabel array_pinjam diisi dengan daftar peminjaman buku pada program utama
  variabel nama_user digunakan untuk mengetahui pengguna yang akan meminjam buku }


var
    buku_yang_ditemukan : Buku;
    id : integer;
    tanggal1 : Tanggal;
    index : integer;
    stringtanggal : string;
    pinjam : Peminjaman;
begin 
    { Blok Input }
    write('Masukkan id buku yang ingin dipinjam: ');
    readln(id);
    write('Masukkan tanggal hari ini: ');
    readln(stringtanggal);

    { Blok proses (mencari id yang cocok, mencatat tanggal peminjaman buku, dan meminjam buku) }
    buku_yang_ditemukan := cari_buku_dengan_id(id, array_buku, index);
    if (buku_yang_ditemukan.jumlah_buku > 0) then begin
        tanggal1 := StringToTanggal(stringtanggal);

        pinjam.Username := nama_user;
        pinjam.ID_buku := id;
        pinjam.Tanggal_Peminjaman := tanggal1;
        pinjam.Tanggal_Batas_Pengembalian := TambahHari(tanggal1, 7);
        pinjam.Status_Pengembalian := 'belum';

        SetLength(array_pinjam, Length(array_pinjam)+1);
        array_pinjam[High(array_pinjam)] := pinjam;
        
        buku_yang_ditemukan.jumlah_buku := buku_yang_ditemukan.jumlah_buku - 1;
        array_buku[index] := buku_yang_ditemukan;

        { Blok output }
        writeln('Buku ', buku_yang_ditemukan.judul_buku, ' berhasil dipinjam!');
        writeln('Tersisa ', buku_yang_ditemukan.jumlah_buku, ' buku ', buku_yang_ditemukan.judul_buku);
    end else begin
        writeln('Buku ', buku_yang_ditemukan.judul_buku, ' sedang habis!');
        writeln('Coba lain kali.');
    end;
end;    

end.