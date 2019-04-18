unit uBukuHilang;
{ NIM / Nama    : 16518185 / Mohamad Alamsyah }
{ unit uLaporanBukuHilang melihat laporan buku yang hilang,
seperti pada F07 - Melaporkan buku yang hilang }

{ KAMUS }
interface
uses
    uTanggal;
    uTipeData;
    uCariBuku;

procedure bukuhilang (array_hilang : Arr_Laporan_Buku_Hilang; nama_user : string);

{ ALGORITMA }
implementation

procedure bukuhilang (array_hilang : Arr_Laporan_Buku_Hilang; nama_user : string);
{ Menambah buku hilang dengan input id, judul, serta
tanggal pelaporan buku yang hilang dengan array_hilang
sebagai array berisi daftar buku yang hilang }

var
    id_h            : integer;
    judul_h         : string;
    stringtanggal_h : string;
    hilang          : Laporan_Buku_Hilang;

begin
    { Inisialisasi }
    
    // BLOK INPUT 
    
    write('Masukkan id buku: '); readln(id_h);
    write('Masukkan judul buku: '); readln(judul_h);
    write('Masukkan tanggal pelaporan :'); readln(stringtanggal_h);
    { Penginputan buku hilang }

    tanggal_h := StringToTanggal(stringtotanggal_h);
    { Pengubahan tanggal (type string) menjadi tanggal (type integer)}

    // BLOK PROSES 

    hilang.Username             := nama_user;
    hilang.ID_Buku_Hilang       := idhilang;
    hilang.Judul_Buku_Hilang    := judul_h;
    hilang.Tanggal_Laporan      := StringToTanggal(stringtanggal_h);
    { Menginput data buku yang hilang ke dalam array_hilang }

    SetLength(array_hilang, Length(array_hilang)+1);
    { ^^ Menambah panjang array_hilang untuk memasukkan data 'hilang' }
    array_hilang[High(array_hilang)] := hilang;
    { ^^ Memasukkan data 'hilang' ke elemen terakhir array_hilang }

    // BLOK OUTPUT 

    writeln('Laporan berhasil diterima.');

end.

    { CATATAN : Di uTipeData, tambahkan Judul_Buku_Hilang
    di record Laporan_Buku_Hilang }
