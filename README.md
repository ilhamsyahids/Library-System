# Library-System

Sistem manajemen perpustakaan dengan bahasa Pascal

## Penjelasan singkat unit fitur

**uRegister**
Berisi fungsi `register(<daftar_user>)`, fitur F01

**uLogin**
Berisi fungsi `login(<daftar_user>)`, fitur F02

**uCari**
Berisi fungsi `cari(<daftar_buku>)`, fitur F03

**uCariBukuTahunTerbit**
Berisi fungsi `caritahunterbit(<daftar_buku>)`, fitur F04

**uPinjamBuku**
Berisi fungsi `pinjam_buku(<daftar_buku>, <daftar_pinjam>, <nama_user>)`, fitur F05

**uPengembalianBuku**
Berisi fungsi `kembalikan_buku(<daftar_buku>, <daftar_kembali>, <nama_user>)`, fitur F06

**uBukuHilang**
Berisi fungsi `bukuhilang(<daftar_buku>)`, fitur F07

**uLaporanBukuHilang**
Berisi fungsi `laporanbukuhilang(<daftar_buku>)`, fitur F08

**uTambahBukuBaru**
Berisi fungsi `tambah_buku_baru(<daftar_buku>)`, fitur F09

**uTambahJumlahBuku**
Berisi fungsi `tambah_jumlah_buku(<daftar_buku>)`, fitur F10

**uRiwayat**
Berisi fungsi `riwayat(<daftar peminjaman>, <daftar_buku>)`, fitur F11

**uStatistik**
Berisi fungsi `statistik(<daftar penggunga>, <daftar_buku>)`, fitur F12

**uLoadFile**

**uSaveFile**

**uBukuHilang**
Berisi fungsi `cari_anggota(<daftar_user>)`, fitur F15

## Penjelasan singkat unit tambahan

**uTipeData**
Berisi tipe data yang akan digunakan di kesuluruhan program

**uTanggal**
Berisi tipe data 'Tanggal' dan fungsi-fungsi untuk mengkonversi string-tanggal

**uCariBuku**
Berisi fungsi-fungsi yang berhubungan dengan pencarian buku

**uHashing**
Berisi fungsi-fungsi yang berhubungan dengan hashing password

## FAQ cara pake unit tambahan dll

**Q: Aku mau buat fitur F-XX, perlu apa aja ya?**
A: Pertama-tama, import pake `uses uTipeData;`, terus bikin prosedur yang bakal dipanggil (intinya semua program yang dipake fitur). Namanya disesuaikan sama nama fitur aja, gak usah strict sama banget, yang penting *recognizable*. Terus, kalo misalnya butuh akses database, kayak list buku / list user, kasih parameter array yang dibutuhkan. Misal, Buat fitur F12 - Statistik, perlu deklarasi sbb: `procedure statistik(array_user : Arr_User; array_buku : Arr_Buku);` Terus programnya dimasukin ke blok implementation.

**Q: Aku perlu print/simpan tanggal, gimana caranya ya?**
A: Diawal kode, setelah tulis `unit uXXXX; implementation ...`, harus import / `uses uTanggal;` (sekalian import `uTipeData` kalo perlu). Terus kalo mau cetak tanggal (formatnya DD/MM/YYYY), pake fungsi `TanggalToString(<Tanggal>)`. Kalo mau buat data bentukan tanggal, pake fungsi `StringToTanggal(<String>)`, jangan lupa harus berformat DD/MM/YYYY.

## Evaluasi

- Pinjam satu buku, masa bisa kembalikan dua buku? masa bisa lapor hilang dua buku?
- Bug uCari, uSave/uLoad
