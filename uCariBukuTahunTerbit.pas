{16518115/Muhammad Firas}
{unit pencarian buku berdasarkan tahun terbit}

unit uCariBukuTahunTerbit;

// Kamus
interface
    uses uTipeData;
    procedure CariTahunTerbit(array_Buku : Arr_Buku);
    procedure sort_string(array_buku : Arr_Buku);

// Algoritma
implementation
    // Procedure sort array of string
    procedure sort_string(array_buku : Arr_Buku);
        // variabel array_buku diisi dengan daftar judul buku
        // pada procedure Cari
        var
            i, j, n : Integer;
            temp : Buku;

        begin
            n := Length(array_buku);
            for i:=0 to n-1 do begin
                for j:=0 to n-1 do begin
                    if (array_buku[j].judul_buku >= array_buku[j+1].judul_buku) then
                        begin
                            temp          := array_buku[j+1];
                            array_buku[j+1] := array_buku[j];
                            array_buku[j] := temp;
                    end;
                end;
            end;
        end;

    
    // Procedure cari buku berdasarkan kategori 
    // menggunakan procedure sort array of string
    procedure CariTahunTerbit(array_Buku : Arr_Buku);
        // variabel array_buku diisi dengan daftar buku
        // pada program utama
        var
        	tahun : integer;
            jenis : string;
            i, j, n : Integer;
            ada, valid : Boolean;
            tahunbuku : Arr_buku;

        begin
            valid := False;
            ada := False;
            i := 0;
            n := Length(array_Buku);
            SetLength(tahunbuku, 0);
            
            // Skema validasi untuk input kategori
            repeat
            	write('Masukkan tahun: '); readln(tahun);
                Write('Masukkan kategori: '); readln(jenis);
                case jenis of
                    '<' : 
                        begin 
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit < tahun) then begin
                    				SetLength(tahunbuku, Length(tahunbuku)+1);
    								tahunbuku[High(tahunbuku)] := array_buku[i];
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '<=' : 
                        begin 
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit <= tahun) then begin
                    				SetLength(tahunbuku, Length(tahunbuku)+1);
    								tahunbuku[High(tahunbuku)] := array_buku[i];
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '=' : 
                        begin 
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit = tahun) then begin
                    				SetLength(tahunbuku, Length(tahunbuku)+1);
    								tahunbuku[High(tahunbuku)] := array_buku[i];
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '>=' : 
                        begin 
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit >= tahun) then begin
                    				SetLength(tahunbuku, Length(tahunbuku)+1);
    								tahunbuku[High(tahunbuku)] := array_buku[i];
    								ada := true;
                				end;
                				i := i + 1;
            				end;
                            valid := True;
                        end;
                    '>' : 
                        begin 
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit > tahun) then begin
                    				SetLength(tahunbuku, Length(tahunbuku)+1);
    								tahunbuku[High(tahunbuku)] := array_buku[i];
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    else begin
                    Writeln('Kategori ', jenis, ' tidak valid');
                    end;
                end;
            until valid;

            

            // Penampilan hasil pencarian
            Writeln();
            WriteLn('Buku yang terbit ', jenis, ' ', tahun);
            sort_string(tahunbuku);
            for j:=0 to (Length(tahunbuku)-1) do
            begin
              writeln(tahunbuku[j].ID_Buku, ' | ', tahunbuku[j].Judul_Buku, ' | ', tahunbuku[j].Author);
            end;
            if not(ada) then
            begin
            WriteLn('Tidak ada buku dalam kategori ini.');
            end;
        end;
end.