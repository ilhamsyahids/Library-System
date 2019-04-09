# Library-System

Sistem manajemen perpustakaan dengan bahasa Pascal

## Penjelasan singkat unit fitur

**uRegister**
Berisi fungsi `register(<daftar user>)`, fitur F01

**uLogin**
Berisi fungsi `login(<daftar user>)`, fitur F02

**uCari**
Berisi fungsi `cari(<daftar buku>)`, fitur F03

**uTambahJumlahBuku**
Berisi fungsi `tambah_jumlah_buku(<daftar buku>)`, fitur F10

**uRiwayat**
Berisi fungsi `riwayat(<daftar peminjaman>, <daftar buku>)`, fitur F11

**uStatistik**
Berisi fungsi `statistik(<daftar penggunga>, <daftar buku>)`, fitur F12

## Penjelasan singkat unit tambahan

**uTipeData**
Berisi tipe data yang akan digunakan di kesuluruhan program

**uTanggal**
Berisi tipe data 'Tanggal' dan fungsi-fungsi untuk mengkonversi string-tanggal

**uCariBuku**
Berisi fungsi-fungsi yang berhubungan dengan pencarian buku

## FAQ cara pake unit tambahan dll

**Q: Aku mau buat fitur F-XX, perlu apa aja ya?**
A: Pertama-tama, import pake `uses uTipeData;`, terus bikin prosedur yang bakal dipanggil (intinya semua program yang dipake fitur). Namanya disesuaikan sama nama fitur aja, gak usah strict sama banget, yang penting *recognizable*. Terus, kalo misalnya butuh akses database, kayak list buku / list user, kasih parameter array yang dibutuhkan. Misal, Buat fitur F12 - Statistik, perlu deklarasi sbb: `procedure statistik(array_user : Arr_User; array_buku : Arr_Buku);` Terus programnya dimasukin ke blok implementation.

**Q: Aku perlu print/simpan tanggal, gimana caranya ya?**
A: Diawal kode, setelah tulis `unit uXXXX; implementation ...`, harus import / `uses uTanggal;` (sekalian import `uTipeData` kalo perlu). Terus kalo mau cetak tanggal (formatnya DD/MM/YYYY), pake fungsi `TanggalToString(<Tanggal>)`. Kalo mau buat data bentukan tanggal, pake fungsi `StringToTanggal(<String>)`, jangan lupa harus berformat DD/MM/YYYY.