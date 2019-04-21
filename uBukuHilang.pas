unit uBukuHilang;
{ NIM / Nama    : 16518185 / Mohamad Alamsyah }
{ unit uLaporanBukuHilang melihat laporan buku yang hilang,
seperti pada F07 - Melaporkan buku yang hilang }

{ KAMUS }
interface
    uses
        uTanggal,
        uTipeData,
        uCariBuku;

    procedure bukuhilang (var array_buku : Arr_Buku; var array_hilang : Arr_Laporan_Buku_Hilang; nama_user: String);

{ ALGORITMA }
implementation

    procedure bukuhilang (var array_buku : Arr_Buku; var array_hilang : Arr_Laporan_Buku_Hilang; nama_user: String);
    { Menambah buku hilang dengan input id, judul, serta
    tanggal pelaporan buku yang hilang dengan array_hilang
    sebagai array berisi daftar buku yang hilang }

    var
        id_h, n         : integer;
        judul_h         : string;
        stringtanggal_h : string;
        hilang          : Laporan_Buku_Hilang;
        index           : integer;
        buku_hilang     : Buku;

    begin
        { Inisialisasi }
        
        // BLOK INPUT 
        
        write('Masukkan id buku: '); readln(id_h);
        write('Masukkan judul buku: '); readln(judul_h);
        write('Masukkan tanggal pelaporan: '); readln(stringtanggal_h);
        { Penginputan buku hilang }

        // BLOK PROSES 

        buku_hilang := cari_buku_dengan_id(id_h, array_buku, index);
        buku_hilang.jumlah_buku := buku_hilang.jumlah_buku - 1;
        array_buku[index] := buku_hilang;

        hilang.Username             := nama_user;
        hilang.ID_Buku_Hilang       := id_h;
        hilang.Tanggal_Laporan      := StringToTanggal(stringtanggal_h);
        { Menginput data buku yang hilang ke dalam array_hilang }

        n := Length(array_hilang)+1;
        SetLength(array_hilang, n);
        { ^^ Menambah panjang array_hilang untuk memasukkan data 'hilang' }
        array_hilang[n-1] := hilang;
        { ^^ Memasukkan data 'hilang' ke elemen terakhir array_hilang }

        // BLOK OUTPUT 

        writeln('Laporan berhasil diterima.');

    end;
end.

    { CATATAN : Di uTipeData, tambahkan Judul_Buku_Hilang
    di record Laporan_Buku_Hilang }
