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
        id, jumlah, tahun : Integer;
        judul, pengarang, kategori : String;

    begin

        // BLOK INPUT

        writeln('Masukkan Informasi buku yang ditambahkan:');
        write('Masukkan id buku:' );
        readln(id);
        write('Masukkan judul buku: ');
        readln(judul);
        write('Masukkan pengarang buku: ');
        readln(pengarang);
        write('Masukkan jumlah buku: ');
        readln(jumlah);
        write('Masukkan tahun terbit buku: ');
        readln(tahun);
        write('Masukkan kategori buku:');
        readln(kategori);
        { Penginputan buku baru }

        bukubaru.ID_Buku        := id;
        bukubaru.Judul_Buku     := judul;
        bukubaru.Author         := pengarang;
        bukubaru.Jumlah_Buku    := jumlah;
        bukubaru.Tahun_Penerbit := tahun;
        bukubaru.Kategori       := kategori;
        { Inisialisasi data untuk dimasukkan ke array_buku }

        SetLength(array_buku, (Length(array_buku)+1));
        { ^^ Penambahan elemen array untuk memasukkan rekaman 'bukubaru' }
        array_buku[High(array_buku)] := bukubaru;
        { ^^ Penambahan rekaman 'bukubaru' ke elemen akhir array_buku }

        // BLOK OUTPUT

        writeln('Buku berhasil ditambahkan ke dalam sistem!');

    { Terminasi }
    end;
    
end.