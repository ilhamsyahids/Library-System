unit uCariBukuTahunTerbit;
{ Dibuat oleh Muhammad Firas (16518115)
  Unit ini mencari buku berdasarkan kategori tahun buku tersebut diterbitkan
  F04 - Peminjaman Buku }

{ KAMUS }
interface
    uses uTipeData, uCari;
    procedure CariTahunTerbit(array_Buku : Arr_Buku);

{ AlGORITMA }
implementation
    { Procedure cari buku berdasarkan kategori 
      menggunakan procedure sort array of string dari unit uCari }
    procedure CariTahunTerbit(array_Buku : Arr_Buku);
        { variabel array_buku diisi dengan daftar buku
          pada program utama }
        var
        	tahun : integer;
            jenis : string;
            i, j, n, nk : Integer;
            ada, valid : Boolean;
            tahunbuku : Arr_String;

        begin
            valid := False;
            ada := False;
            i := 0;
            n := Length(array_Buku);
            
            
            { Skema validasi untuk input kategori }
            repeat
            	write('Masukkan tahun: '); readln(tahun);
                Write('Masukkan kategori: '); readln(jenis);
                case jenis of
                    '<' : 
                        begin 
                            nk := 0;
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit < tahun) then begin
                    				nk := nk + 1;
                                    SetLength(tahunbuku, nk);
    								tahunbuku[nk-1] := array_buku[i].Judul_Buku;
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '<=' : 
                        begin 
                            nk := 0;
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit <= tahun) then begin
                    				nk := nk+1;
                                    SetLength(tahunbuku, nk);
    								tahunbuku[nk-1] := array_buku[i].Judul_Buku;
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '=' : 
                        begin 
                            nk := 0;
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit = tahun) then begin
                    				nk := nk+1;
                                    SetLength(tahunbuku, nk);
    								tahunbuku[nk-1] := array_buku[i].Judul_Buku;
    								ada := true;
                				end;
                				i := i + 1;
            				end; 
                            valid := True;
                        end;
                    '>=' : 
                        begin 
                            nk := 0;
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit >= tahun) then begin
                    				nk := nk+1;
                                    SetLength(tahunbuku, nk);
    								tahunbuku[nk-1] := array_buku[i].Judul_Buku;
    								ada := true;
                				end;
                				i := i + 1;
            				end;
                            valid := True;
                        end;
                    '>' : 
                        begin 
                            nk := 0;
            				while i<n do begin
                				if (array_Buku[i].Tahun_Penerbit > tahun) then begin
                    				nk := nk+1;
                                    SetLength(tahunbuku, nk);
    								tahunbuku[nk-1] := array_buku[i].Judul_Buku;
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

            

            { Penampilan hasil pencarian }
            Writeln();
            WriteLn('Buku yang terbit ', jenis, ' ', tahun);
            sort_string(tahunbuku);
            if (nk > 0) then
            begin
                for i:=1 to nk do begin
                    for j:=0 to n-1 do begin
                        if (tahunbuku[i] = array_Buku[j].Judul_Buku) then begin
                            writeln(array_Buku[j].ID_Buku, ' | ', array_Buku[j].Judul_Buku, ' | ', array_Buku[j].Author);
                        end;
                    end;
                end;
            end;
            if not(ada) then begin
                WriteLn('Tidak ada buku dalam kategori ini.');
            end;
        end;
end.