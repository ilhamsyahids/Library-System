unit uBuku;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini berisi bentukan 'Buku', beserta enumerasi dan fungsi yang berhubungan dengan buku}

{ KAMUS }
interface
type
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

function cari_buku_dengan_id (id : integer; array_buku : array of Buku; var index : integer) : Buku;

{ ALGORITMA }
implementation
function cari_buku_dengan_id (id : integer; array_buku : array of Buku; var index : integer) : Buku;
{ Mencari buku dengan id_buku 'id' pada daftar buku 'array_buku', serta mengoutput index dari buku yang ditemukan }
var
    besar_array, i : integer;
    found : boolean;
begin
    besar_array := Length(array_buku);
    found := false;
    i := 1;

    { Algoritma pencarian sequensial dengan boolean}
    while (i < besar_array) and (not(Found)) do
    begin
        if (array_buku[i].ID_Buku = id) then
            Found := true
        else
            i := i + 1;
    end; { i >= besar_array or Found}
    
    if (Found) then
        index := i
    else
        index := 0;
    
    cari_buku_dengan_id := array_buku[index];
end;

end.