unit uTanggal;

interface

    type
        { Bentukan Tanggal }
        Tanggal = record
            Tanggal : Integer;  { 01 - 31 }
            Bulan : Integer;    { 01 - 12 }
            Tahun : Integer;    { YYYY }
    end;

    function StringToTanggal (input : String) : Tanggal;

    function TanggalToString (input : Tanggal) : String;

    function TambahHari (tgl : Tanggal; tambahan : Integer) : Tanggal;

    function IsLebihTelat (tgl1, tgl2 : Tanggal) : Boolean;

    function SumTanggalBulan (b : Integer; tahunKhabisat : Boolean) : Integer;

    function IsKhabisat (tahun : Integer) : Boolean;

implementation

    function IsKhabisat (tahun : Integer) : Boolean;
        begin
            IsKhabisat := ((tahun mod 400 = 0) or (tahun mod 100 <> 0)) and (tahun mod 4 = 0);
        end;

    function SumTanggalBulan (b : Integer; tahunKhabisat : Boolean) : Integer;
        var
            add : Integer;
            Bulan : Integer;
        begin
            add := 0;
            Bulan := b;
            if (Bulan = 12) then
            begin
                Bulan := 03;
                add := add + 275;
            end
            else if (Bulan = 11) then
            begin
                Bulan := 03;
                add := add + 245;
            end
            else if (Bulan = 10) then
            begin
                Bulan := 03;
                add := add + 214;
            end
            else if (Bulan = 09) then
            begin
                Bulan := 03;
                add := add + 184;
            end
            else if (Bulan = 08) then
            begin
                Bulan := 03;
                add := add + 153;
            end
            else if (Bulan = 07) then
            begin
                Bulan := 03;
                add := add + 122;
            end
            else if (Bulan = 06) then
            begin
                Bulan := 03;
                add := add + 92;
            end
            else if (Bulan = 05) then
            begin
                Bulan := 03;
                add := add + 61;
            end
            else if (Bulan = 04) then
            begin
                Bulan := 03;
                add := add + 31;
            end;
            if (Bulan = 03) then
            begin
                Bulan := 02;
                if (tahunKhabisat) then
                    add := add + 29
                else
                    add := add + 28;
            end;
            if (Bulan = 02) then
            begin
                add := add + 31;
            end;

            SumTanggalBulan := add;
        end;

    procedure TanggalToBulan (var tgl, bulan : Integer; khabisat : Boolean);
        begin
            if (tgl > 31) then                                      // Januari
            begin bulan := bulan + 1; tgl := tgl - 31;
            if ((tgl > 28) and not(khabisat)) then                    // Februari
            begin bulan := bulan + 1; tgl := tgl - 28; end
            else if ((tgl > 29) and khabisat) then
            begin bulan := bulan + 1; tgl := tgl - 29; end;
            if (tgl > 31) then                                      // Maret
            begin bulan := bulan + 1; tgl := tgl - 31;
            if (tgl > 30) then                                      // April
            begin bulan := bulan + 1; tgl := tgl - 30;
            if (tgl > 31) then                                      // Mei
            begin bulan := bulan + 1; tgl := tgl - 31;
            if (tgl > 30) then                                      // Juni
            begin bulan := bulan + 1; tgl := tgl - 30;
            if (tgl > 31) then                                      // Juli
            begin bulan := bulan + 1; tgl := tgl - 31;
            if (tgl > 31) then                                      // Agustus
            begin bulan := bulan + 1; tgl := tgl - 31;
            if (tgl > 30) then                                      // September
            begin bulan := bulan + 1; tgl := tgl - 30;
            if (tgl > 31) then                                      // Oktober
            begin bulan := bulan + 1; tgl := tgl - 31;
            if (tgl > 30) then                                      // November
            begin bulan := bulan + 1; tgl := tgl - 30; end;
            end; end; end; end; end; end; end; end; end;
        end;

    function StringToTanggal (input : String) : Tanggal;
        { Input string berbentuk DD/MM/YYYY }
        var
            output : Tanggal;
            temp : Integer;
            errorCode : Integer;
        begin
            Val(input[1], temp, errorCode);
            output.Tanggal := temp * 10;
            Val(input[2], temp, errorCode);
            output.Tanggal := output.Tanggal + temp;

            Val(input[4], temp, errorCode);
            output.Bulan := temp * 10;
            Val(input[5], temp, errorCode);
            output.Bulan := output.Bulan + temp;

            Val(input[7], temp, errorCode);
            output.Tahun := temp * 1000;
            Val(input[8], temp, errorCode);
            output.Tahun := output.Tahun + temp * 100;
            Val(input[9], temp, errorCode);
            output.Tahun := output.Tahun + temp * 10;
            Val(input[10], temp, errorCode);
            output.Tahun := output.Tahun + temp;

            StringToTanggal := output;
        end;

    function TanggalToString (input : Tanggal) : String;
        { Output string berbentuk DD/MM/YYYY }
        var
            output : String;
            temp : String;
        begin
            Str(input.Tanggal, temp);
            if (input.Tanggal < 10) then
                output := '0' + (temp) + '/'
            else
                output := (temp) + '/';
            Str(input.Bulan, temp);
            if (input.Bulan < 10) then
                output := output + '0' + (temp) + '/' 
            else
                output := output + (temp) + '/';
            Str(input.Tahun, temp);
            output := output + (temp);

            TanggalToString := output;
        end;

    function TambahHari (tgl : Tanggal; tambahan : Integer) : Tanggal;
        var
            tglBr : Tanggal;
            add : Integer;
        begin
            add := 0;
            
            add := tambahan;
            add := add + tgl.Tanggal;
            add := add + SumTanggalBulan(tgl.Bulan, IsKhabisat(tgl.Tahun));
            
            tglBr := tgl;
            tglBr.Bulan := 1;
            while (add > 365) do
            begin
                tglBr.Tahun := tglBr.Tahun + 1;
                if (IsKhabisat(tglBr.Tahun)) then
                    add := add - 366
                else
                    add := add - 365;
            end;

            if ((add = 365) and not(IsKhabisat(tglBr.Tahun))) then
            begin
                add := 0;
                tglBr.Tahun := tglBr.Tahun + 1;
            end;

            TanggalToBulan(add, tglBr.Bulan, IsKhabisat(tglBr.Tahun));
            tglBr.Tanggal := add;
            
            TambahHari := tglBr;
        end;

    function IsLebihTelat (tgl1, tgl2 : Tanggal) : Boolean;
        var
            add1, add2 : Integer;
        begin
            add1 := 0;
            add1 := add1 + tgl1.Tanggal;
            add1 := add1 + SumTanggalBulan(tgl1.Bulan, IsKhabisat(tgl1.Tahun));

            add2 := 0;
            add2 := add2 + tgl2.Tanggal;
            add2 := add2 + SumTanggalBulan(tgl2.Bulan, IsKhabisat(tgl2.Tahun));

            if (tgl1.Tahun = tgl2.Tahun) then
                IsLebihTelat := add1 > add2
            else
                IsLebihTelat := tgl1.Tahun > tgl2.Tahun;
        end;

end.