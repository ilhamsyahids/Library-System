unit uLaporanBukuHilang;
{ NIM / Nama    : 16518185 / Mohamad Alamsyah }
{ unit uLaporanBukuHilang melihat laporan buku yang hilang,
seperti pada F08 - Melihat laporan buku yang hilang }

{ KAMUS }
interface
uses
    uTanggal;
    uTipeData;

procedure laporanbukuhilang (array_hilang : Arr_Laporan_Buku_Hilang);

{ ALGORITMA }
implementation
procedure laporanbukuhilang (array_hilang : Arr_Laporan_Buku_Hilang);
{ Menampilkan laporan buku hilang yang berisi daftar buku 
berisi id buku, judul buku, serta tanggal buku hilang dengan 
variabel array_bukuhilang sebagai daftar buku hilang dengan 
jenis Arr_Laporan_Buku_Hilang }
var
    
begin
    N_bukuhilang := Length(array_bukuhilang);
    { Inisialisasi }
    
    for i := 0 to N_bukuhilang - 1 do
    begin
        println(array_bukuhilang[i].ID_Buku_Hilang, ' | ', 
        array_bukuhilang.Judul_Buku_Hilang, ' | ', 
        array_bukuhilang.Tanggal_Laporan)
    end;

    { CATATAN : Di uTipeData, tambahkan Judul_Buku_Hilang
    di record Laporan_Buku_Hilang }
