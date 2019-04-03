unit uTipeData;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini berisi tipe data dasar yang akan digunkan di kesuluruhan program}

interface

uses
    SysUtils;

{ KAMUS }
type
    { Bentukan Buku }
    Kategori = (
        Sastra,
        Sains,
        Manga,
        Sejarah,
        Programming
    );

    Buku = record
        ID_Buku : integer;
        Judul_Buku : string;
        Author : string;
        Jumlah_Buku : integer;
        Kategori : Kategori;
    end;

    { Bentukan pengguna }
    Role = (
        Pengunjung,
        Admin
    );

    User = record
        Nama : string;
        Alamat : string;
        Username : string;
        Password : string;
        Role : Role;
    end;

    { Bentukan Peminjaman }
    Status_Pengembalian = (
        sudah,
        belum
    );

    Peminjaman = record
        Username : string;
        ID_Buku : integer;
        Tanggal_Peminjaman : TDateTime;
        Tanggal_Batas_Pengembalian : TDateTime;
        Status_Pengembalian : Status_Pengembalian;
    end;

    { Bentukan Pengembalian }
    Pengembalian = record
        Username : string;
        ID_Buku : integer;
        Tanggal_Pengembalian : TDateTime;
    end;

    { Bentukan Laporan Hilang }
    Laporan_Buku_Hilang = record
        Username : string;
        ID_Buku_Hilang : integer;
        Tanggal_Laporan : TDateTime;
    end;

implementation
    
end.