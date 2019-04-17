unit uCari;
// Dibuat Oleh Ilhamsyahids (16518360)
// Unit ini menampilkan pencarian buku berdasarkan kategori
// F03 - Pencarian buku berdasarkan kategori


// Kamus
interface
    uses uTipeData;
    procedure sort_string(array_string : Arr_String);
    procedure Cari(array_Buku : Arr_Buku);

// Algoritma
implementation
    // Procedure sort array of string
    procedure sort_string(array_string : Arr_String);
        // variabel array_string diisi dengan daftar judul buku
        // pada procedure Cari
        var
            i, j, n : Integer;
            temp : String;

        begin
            n := Length(array_string);
            if (n>1) then begin
                for i:=0 to n-1 do begin
                    for j:=0 to n-1 do begin
                        if (array_string[j] >= array_string[j+1]) then begin
                                temp          := array_string[j+1];
                                array_string[j+1] := array_string[j];
                                array_string[j] := temp;
                        end;
                    end;
                end;
            end;
        end;

    
    // Procedure cari buku berdasarkan kategori 
    // menggunakan procedure sort array of string
    procedure Cari(array_Buku : Arr_Buku);
        // variabel array_buku diisi dengan daftar buku
        // pada program utama
        var
            kat : String;
            judul : Arr_String;
            i, j, n, m, nk : Integer;
            ada, valid : Boolean;

        begin
            valid := False;
            ada := False;
            i := 0;
            n := Length(array_Buku);
            
            // Skema validasi untuk input kategori
            repeat
                Write('Masukkan kategori: '); ReadLn(kat);
                if (kat = 'sastra') or (kat = 'programming') or (kat = 'sains') or (kat = 'manga') or (kat = 'sejarah') then begin
                    valid := True;                
                end else begin
                    Writeln('Kategori ', kat, ' tidak valid');
                end;
            until valid;
            
            // Pemasukkan hasil pencarian kedalam array baru
            nk := 0;
            while i<n do begin
                    if (array_Buku[i].kategori = kat) then begin
                        nk := nk + 1;
                        SetLength(judul, nk);
                        ada := True;
                        judul[nk-1] := array_Buku[i].Judul_Buku;
                    end;
                i := i + 1;
            end;

            // Penampilan hasil pencarian
            Writeln();
            WriteLn('Hasil pencarian: ');
            sort_string(judul);
            for i:=0 to nk do begin
                for j:=0 to n-1 do begin
                    if (array_Buku[j].Kategori = kat) then begin
                        if (judul[i] = array_Buku[j].Judul_Buku) then begin
                            writeln(array_Buku[j].ID_Buku, ' | ', array_Buku[j].Judul_Buku, ' | ', array_Buku[j].Author);
                        end;
                    end;
                end;
            end;

            // Tidak ada buku
            if not(ada) then
            begin
            WriteLn('Tidak ada buku dalam kategori ini.');
            end;
        end;
end.