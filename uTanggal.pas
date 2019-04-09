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

implementation

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

end.