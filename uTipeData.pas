unit uTipeData;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini berisi tipe data dasar yang akan digunkan di kesuluruhan program}

interface

uses uTanggal;

{ KAMUS }
type

    { Bentukan Buku }
    Buku = record
        ID_Buku : integer;
        Judul_Buku : string;
        Author : string;
        Jumlah_Buku : integer;
        Tahun_Penerbit : integer;
        Kategori : String;
    end;

    Arr_Buku = array of Buku;

    { Bentukan pengguna }
    User = record
        Nama : string;
        Alamat : string;
        Username : string;
        Password : string;
        Role : String;
    end;

    Arr_User = array of User;

    { Bentukan Peminjaman }
    Peminjaman = record
        Username : string;
        ID_Buku : integer;
        Tanggal_Peminjaman : Tanggal;
        Tanggal_Batas_Pengembalian : Tanggal;
        Status_Pengembalian : String;
    end;

    Arr_Peminjaman = array of Peminjaman;

    { Bentukan Pengembalian }
    Pengembalian = record
        Username : string;
        ID_Buku : integer;
        Tanggal_Pengembalian : Tanggal;
    end;

    Arr_Pengembalian = array of Pengembalian;

    { Bentukan Laporan Hilang }
    Laporan_Buku_Hilang = record
        Username : string;
        ID_Buku_Hilang : integer;
        Tanggal_Laporan : Tanggal;
    end;

    Arr_Laporan_Buku_Hilang = array of Laporan_Buku_Hilang;

    { Tipe Array }
    Arr_String = array of String;
    Arr_Integer = array of Integer;
    Arr_Boolean = array of Boolean;
    
implementation
    
end.