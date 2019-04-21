unit uLaporanBukuHilang;
{ NIM / Nama    : 16518185 / Mohamad Alamsyah }
{ unit uLaporanBukuHilang melihat laporan buku yang hilang,
seperti pada F08 - Melihat laporan buku yang hilang }

{ KAMUS }
interface
    uses
        uTanggal,
        uTipeData;

    procedure laporanbukuhilang (array_bukuhilang : Arr_Laporan_Buku_Hilang);

{ ALGORITMA }
implementation
    procedure laporanbukuhilang (array_bukuhilang : Arr_Laporan_Buku_Hilang);
    { Menampilkan laporan buku hilang yang berisi daftar buku 
    berisi id buku, judul buku, serta tanggal buku hilang dengan 
    variabel array_bukuhilang sebagai daftar buku hilang dengan 
    jenis Arr_Laporan_Buku_Hilang }
    var
        i, N_bukuhilang : Integer;
        
    begin
        N_bukuhilang := Length(array_bukuhilang);
        { Inisialisasi }
        
        WriteLn(array_bukuhilang[N_bukuhilang].Username);
        for i := 0 to N_bukuhilang - 1 do begin
            WriteLn(array_bukuhilang[i].ID_Buku_Hilang, ' | ', 
            array_bukuhilang[i].Username, ' | ', 
            TanggalToString(array_bukuhilang[i].Tanggal_Laporan));
        end;

        { CATATAN : Di uTipeData, tambahkan Judul_Buku_Hilang
        di record Laporan_Buku_Hilang }
    end;

end.