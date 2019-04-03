unit uPeminjaman;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini berisi bentukan 'Peminjaman', beserta enumerasi 'Status_Pengembalian'}

interface
    
uses
    SysUtils;

type
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
    
implementation
    
end.