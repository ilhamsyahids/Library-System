unit uTambahBukuBaru;
{ NIM / Nama    : 16518185 / Mohamad Alamsyah }
{ Unit ini menambahkan prosedur menambahkan buku baru, seperti 
pada F09 - Menambahkan buku baru ke dalam sistem }

{ KAMUS }
interface
uses
    uTipeData,
    uCariBuku;

procedure tambah_buku_baru (var array_buku : Arr_Buku);

{ ALGORITMA }
implementation

procedure tambah_buku_baru (var array_buku : Arr_Buku);

var
    bukubaru : Buku;

begin

    // BLOK INPUT

    writeln('Masukkan Informasi buku yang ditambahkan:');
    write('Masukkan id buku:' );
    readln(id_b);
    write('Masukkan judul buku: ');
    readln(judul_buku_b);
    write('Masukkan pengarang buku: ');
    readln(pengarang_b);
    write('Masukkan jumlah buku: ');
    readln(jumlah_buku_b);
    write('Masukkan tahun terbit buku: ');
    readln(tahun_penerbit_b);
    write('Masukkan kategori buku:');
    readln(kategori_b);
    { Penginputan buku baru }

    bukubaru.ID_Buku        := id_b;
    bukubaru.Judul_Buku     := judul_buku_b;
    bukubaru.Author         := pengarang_b;
    bukubaru.Jumlah_Buku    := jumlah_buku_b;
    bukubaru.Tahun_Penerbit := tahun_penerbit_b;
    bukubaru.Kategori       := kategori_b;
    { Inisialisasi data untuk dimasukkan ke array_buku }

    SetLength(array_buku, (Length(array_buku)+1));
    { ^^ Penambahan elemen array untuk memasukkan rekaman 'bukubaru' }
    array_buku[High(array_buku)] := bukubaru;
    { ^^ Penambahan rekaman 'bukubaru' ke elemen akhir array_buku }

    // BLOK OUTPUT

    writeln('Buku berhasil ditambahkan ke dalam sistem!');

end;
{ Terminasi }

end.