unit uDenda;


interface
    uses uTanggal;

    function hitunghari (tgl1, tgl2 : Tanggal) : Integer;
    { function untuk menghitung hari dari tgl1 dan tgl2 dengan tgl1,tgl2 adalah tipe bentukan Tanggal dan tgl2 lebih dahulu daripada tgl1. }
    { I.S : dua buah tanggal} 
    { F.S : integer hari diantara dua Tanggal }


implementation
    function haridibulan (tgl : Tanggal) : Integer;
        var 
            m : Integer;

        begin
            m := tgl.bulan;
            if (m = 2) then begin
                if IsKhabisat(tgl.Tahun) then begin
                    haridibulan := 29;    
                end else begin { Bukan kabisat }
                    haridibulan := 28;    
                end;
            end else if (m = 1) or (m = 3) or (m = 5) or (m = 7) or (m = 8) or (m = 10) or (m = 12) then begin
                haridibulan := 31;
            end else begin { Selain bulan diatas }
                haridibulan := 30;    
            end;
        end;

    function hitungtahun(tgl : Tanggal) : Integer;
    { function untuk menghitung hari dari tahun di tgl }
    { I.S : satu buah tanggal}
    { F.S : integer hari di tahun tgl }

        var
            i : Integer;

        begin
            if IsKhabisat(tgl.Tahun) then begin
                hitungtahun := 366;
            end else begin { Bukan Kabisat }
                hitungtahun := 365;
            end;
        end;

    function ToAkhirTahun(tgl : Tanggal): Integer;
    { function untuk menghitung hari dari bulan hingga akhir tahun di tgl }
    { I.S : satu buah tanggal}
    { F.S : integer hari dari bulan hingga akhir tahun di tgl }

        var
            tahun : Integer;

        begin
            tahun := hitungtahun(tgl);

            ToAkhirTahun := tahun - SumTanggalBulan(tgl.Bulan, IsKhabisat(tgl.Tahun));
        end;
        
    function hitunghari (tgl1, tgl2 : Tanggal) : Integer;

        var
            tahun, i : Integer;
            add1, add2 : Integer;

        begin
            add1 := 0;
            add1 := add1 + tgl1.Tanggal;
            add1 := add1 + SumTanggalBulan(tgl1.Bulan, IsKhabisat(tgl1.Tahun));

            add2 := 0;
            add2 := add2 + tgl2.Tanggal;
            add2 := add2 + SumTanggalBulan(tgl2.Bulan, IsKhabisat(tgl2.Tahun));

            tahun := 0;
            if (tgl1.Tahun <> tgl2.Tahun) then begin
                for i:= tgl2.Tahun to tgl1.Tahun - 1 do begin
                    if IsKhabisat(i) then begin
                        tahun := tahun + 366;
                    end else begin { Bukan Kabisat }
                        tahun := tahun + 365;
                    end;
                end;
            end;
            hitunghari := tahun + (add1 - add2);
        end;
end.