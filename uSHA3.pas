unit uSHA3;
{ Referensi:
  https://www.movable-type.co.uk/scripts/sha3.html
  https://keccak.team/keccak_specs_summary.html
  https://github.com/ctz/keccak/blob/master/keccak.py
  https://csrc.nist.gov/projects/cryptographic-standards-and-guidelines/example-values
  https://www.freepascal.org/docs-html/current/rtl/system/ }
{ Ditulis oleh: Chokyi Ozer (16518269) berdasarkan referensi-referensi yang tercantum
  diatas }
{ Unit ini mengubah password menjadi hash menggunakan spesifikasi SHA3, 
  sesuai dengan spesifikasi fitur B01 - Penyimpanan Password }

interface

type
    state = array [0..4, 0..4] of QWord;

function Generate224 (input : String) : String;
function Generate256 (input : String) : String;
function Generate384 (input : String) : String;
function Generate512 (input : String) : String;
function CheckIntegrity (input, hash : String; key : Integer) : Boolean;

implementation

function Pow(x, n : QWord) : QWord;
var i : Integer; out : QWord;
begin
    out := 1;
    for i := 0 to n do
        out := out * x;
    Pow := out;
end;

function StringToHex(s : string) : QWord;
var
    i : Integer;
    out : QWord;
    check : Byte;
begin
    out := 0;
    for i := 1 to Length(s) do
    begin
        check := ord(s[i]);
        if (check >= 48) and (check <= 57) then
            out := out + (check - 48) * (Pow(16, Length(s) - i - 1))
        else { if (check >= 97) and (check <= 102) then }
            out := out + (check - 87) * (Pow(16, Length(s) - i - 1));
    end;
    StringToHex := out;
end;

function Rot(x : QWord; n : Byte) : QWord;
begin
    Rot := (x << n) or (x >> (64-n));
end;

procedure KeccakF1600 (var A : state);
const
    RC : array [0..23] of String = ('0000000000000001', '0000000000008082', '800000000000808a',
                                    '8000000080008000', '000000000000808b', '0000000080000001',
                                    '8000000080008081', '8000000000008009', '000000000000008a',
                                    '0000000000000088', '0000000080008009', '000000008000000a',
                                    '000000008000808b', '800000000000008b', '8000000000008089',
                                    '8000000000008003', '8000000000008002', '8000000000000080',
                                    '000000000000800a', '800000008000000a', '8000000080008081',
                                    '8000000000008080', '0000000080000001', '8000000080008008');
    r : array [0..4, 0..4] of Integer = ((00, 36, 03, 41, 18),
                                         (01, 44, 10, 45, 02),
                                         (62, 06, 43, 15, 61),
                                         (28, 55, 25, 21, 56),
                                         (27, 20, 39, 08, 14));
var
    RCnum : array [0..23] of QWord;
    i, j, k : Integer;
    C, D : array [0..4] of QWord;
    B : array [0..4, 0..4] of QWord;
begin
    { INIT STAGE : Initialize variables }
    for i := 0 to 23 do
    begin
        RCnum[i] := StringToHex(RC[i]);
    end;
    
    { MAIN LOOP }
    for i := 0 to 23 do
    begin
        { θ STAGE }

        { C[x] = A[x,0] xor A[x,1] xor A[x,2] xor A[x,3] xor A[x,4] }
        for j := 0 to 4 do
        begin
            C[j] := A[j, 0];
            for k := 1 to 4 do
            begin
                C[j] := C[j] xor A[j, k];
            end;
        end;
        
        { D[x] = C[x-1] xor rot(C[x+1],1) }
        for j := 0 to 4 do
            D[j] := C[(j + 4) mod 5] xor Rot(C[(j + 1) mod 5], 1);

        { A[x,y] = A[x,y] xor D[x] }
        for j := 0 to 4 do
            for k := 0 to 4 do
                A[j, k] := A[j, k] xor D[j];

        { ρ AND π STAGE }
        { B[y,2*x+3*y] = rot(A[x,y], r[x,y]) }
        for j := 0 to 4 do
            for k := 0 to 4 do
                B[k, (j * 2 + k * 3) mod 5] := Rot(A[j, k], r[j,k]);

        { χ STAGE }
        for j := 0 to 4 do
            for k := 0 to 4 do
                A[j, k] := B[j, k] xor ((not (B[(j + 1) mod 5, k])) and B[(j + 2) mod 5, k]);

        { ι STAGE }
        A[0, 0] := A[0, 0] xor RCnum[i];
    end;

end;

function Keccak1600 (r, c : Integer; m : String) : String;
var
    S : state;
    i, j, k, q : Integer;
    blockSize, l : Integer;
    Pi : QWord;
    Z : AnsiString;
begin

    { INITIALIZATION STAGE: Menginisialisasi variabel-variabel }
    for i := 0 to 4 do
    begin
        for j := 0 to 4 do
        begin
            S[i,j] := 0;
        end;
    end;
    
    { PADDING STAGE: Menambahkan data pada input agar memiliki size perkalian 64-bit }
    q := (r div 8) - (Length(m) mod (r div 8));
    if (q = 1) then
        m := m + Chr(134)
    else if (q = 2) then
        m := m + Chr(6) + Chr(128)
    else
    begin
        m := m + Chr(6);
        for i := 1 to q-2 do
            m := m + Chr(0);
        m := m + Chr(128);
    end;
    
    { ABSORBING STAGE: 'Menyerap' pesan kedalam 'spons' 5x5x64 bit }
    blockSize := r div 8;
    i := 0;
    while (i < Length(m)) do       // Untuk setiap blok pesan
    begin
        for j := 0 to (r div 64) - 1 do 
        begin
            Pi := (ord(m[i + j * 8 + 1]) << 00) + (ord(m[i + j * 8 + 2]) << 08) +
                  (ord(m[i + j * 8 + 3]) << 16) + (ord(m[i + j * 8 + 4]) << 24) + 
                (((ord(m[i + j * 8 + 5]) << 00) + (ord(m[i + j * 8 + 6]) << 08) +
                  (ord(m[i + j * 8 + 7]) << 16) + (ord(m[i + j * 8 + 8]) << 24)) * 4294967296);
            S[j mod 5, j div 5] := S[j mod 5, j div 5] xor Pi;
        end;

        KeccakF1600(S);

        i += blockSize;
    end;
    
    { SQUEEZING STAGE: 'Memeras' spons menjadi string dengan panjang tertentu }
    Z := ''; l := c div 2;
    SetLength(Z, l div 8);
    while (l > 0) do
    begin
        for i := 0 to 4 do
        begin
            for j := 0 to 4 do 
            begin
                k := 0;
                while (k < 8) and (l > 0) do
                begin
                    Z[(((c div 2) - l) div 8) + 1] := Chr((S[j,i] >> (k * 8)) and 255);
                    k := k + 1;
                    l := l - 8;
                end;
            end;
        end;
        if (l > 0) then
            KeccakF1600(S);
    end;

    Keccak1600 := Z;
end;

function Generate224 (input : String) : String;
var
    genHex, outputHex : String;
    i : Integer;
begin
    genHex := Keccak1600(1152, 448, input);
    outputHex := '';
    for i := 1 to Length(genHex) do
    begin
        outputHex := outputHex + HexStr(ord(genHex[i]), 2);
    end;
    Generate224 := Lowercase(outputHex);
end;

function Generate256 (input : String) : String;
var
    genHex, outputHex : String;
    i : Integer;
begin
    genHex := Keccak1600(1088, 512, input);
    outputHex := '';
    for i := 1 to Length(genHex) do
    begin
        outputHex := outputHex + HexStr(ord(genHex[i]), 2);
    end;
    Generate256 := Lowercase(outputHex);
end;

function Generate384 (input : String) : String;
var
    genHex, outputHex : String;
    i : Integer;
begin
    genHex := Keccak1600(832, 768, input);
    outputHex := '';
    for i := 1 to Length(genHex) do
    begin
        outputHex := outputHex + HexStr(ord(genHex[i]), 2);
    end;
    Generate384 := Lowercase(outputHex);
end;

function Generate512 (input : String) : String;
var
    genHex, outputHex : String;
    i : Integer;
begin
    genHex := Keccak1600(576, 1024, input);
    outputHex := '';
    for i := 1 to Length(genHex) do
    begin
        outputHex := outputHex + HexStr(ord(genHex[i]), 2);
    end;
    Generate512 := Lowercase(outputHex);
end;

function CheckIntegrity (input, hash : String; key : Integer) : Boolean;
begin
    case (key) of
        224 : CheckIntegrity := hash = Generate224(input);
        256 : CheckIntegrity := hash = Generate256(input);
        384 : CheckIntegrity := hash = Generate384(input);
        512 : CheckIntegrity := hash = Generate512(input);
    end;
end;

end.