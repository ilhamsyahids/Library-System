unit uCariBuku;
{ Dibuat oleh Chokyi Ozer (16518269) }
{ Unit ini berisi fungsi yang berhubungan dengan pencarian buku}

{ KAMUS }
interface

uses
    uTipeData;

function cari_buku_dengan_id (id : integer; array_buku : array of Buku; var index : integer) : Buku;
function cari_buku_dengan_id (id : integer; array_buku : array of Buku) : Buku;

{ ALGORITMA }
implementation
function cari_buku_dengan_id (id : integer; array_buku : array of Buku; var index : integer) : Buku;
{ Mencari buku dengan id_buku 'id' pada daftar buku 'array_buku', serta mengoutput index dari buku yang ditemukan }
var
    N, i : integer;
    found : boolean;
begin
    N := Length(array_buku);
    found := false;
    i := 1;

    { Algoritma pencarian sequensial dengan boolean}
    while (i < N) and (not(Found)) do
    begin
        if (array_buku[i].ID_Buku = id) then
            Found := true
        else
            i := i + 1;
    end; { i >= N or Found}
    
    if (Found) then
        index := i
    else
        index := 0;
    
    cari_buku_dengan_id := array_buku[index];
end;

function cari_buku_dengan_id (id : integer; array_buku : array of Buku) : Buku;
{ Mencari buku dengan id_buku 'id' pada daftar buku 'array_buku', tanpa mengoutput index dari buku yang ditemukan }
var index : integer;
begin
    cari_buku_dengan_id := cari_buku_dengan_id (id, array_buku, index);
end;

end.