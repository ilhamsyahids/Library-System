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
    { Prosedur untuk menampilkan laporan buku yang hilang }
    { I.S. Tidak ada }
    { F.S. Laporan berupa daftar buku hilang muncul dengan format:
    <ID_buku> | <Judul_buku> | <Tanggal_pelaporan_buku_hilang> }

    var
        i, N_bukuhilang : Integer;
        
    begin
        N_bukuhilang := Length(array_bukuhilang);
        { Inisialisasi }
        WriteLn('Buku yang hilang :');
        for i := 0 to N_bukuhilang - 1 do begin
            WriteLn(array_bukuhilang[i].ID_Buku_Hilang, ' | ', 
            array_bukuhilang[i].Username, ' | ', 
            TanggalToString(array_bukuhilang[i].Tanggal_Laporan));
        end;
        { Menampilkan daftar buku yang telah dilaporkan hilang }
    end;
end.
