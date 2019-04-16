unit ini_header;

interface
	const
		min = 100000;
		arraymin = 1;
		arraymax = 30;
	type
		tanggal = record
			hari 	: string;
			bulan 	: string;
			tahun 	: string;
		end;
		
		buku = record
			ID_Buku 		: integer;
			Judul_Buku 		: string;
			Author 			: string;
			Jumlah_Buku 	: integer;
			Tahun_Penerbit 	: integer;
			Kategori 		: string;
		end;
		
		tabBuku = record
			tab 	: array [arraymin..arraymax] of buku;
			neff 	: integer;
		end;
		
		user = record
			Nama		: string;
			Alamat		: string;
			Username	: string;
			Password	: string;
			Role		: string;
		end;
		
		tabUser = record
			tab 	: array [arraymin..arraymax] of user;
			neff 	: integer;
		end;
		
		peminjaman = record
			Username					: string;
			ID_Buku						: integer;
			Tanggal_Peminjaman			: tanggal;
			Tanggal_Batas_Pengembalian	: tanggal;
			Status_Pengembalian			: string;
		end;
			
		tabPeminjaman = record
			tab 	: array [arraymin..arraymax] of peminjaman;
			neff 	: integer;
		end;
		
		pengembalian = record
			Username				: string;
			ID_Buku					: integer;
			Tanggal_Pengembalian	: tanggal;
		end;
		
		tabPengembalian = record
			tab 	: array [arraymin..arraymax] of pengembalian;
			neff 	: integer;
		end;
		
		kehilangan = record
			Username		: string;
			ID_Buku_Hilang	: integer;
			Tanggal_Laporan	: tanggal;
		end;
		
		tabKehilangan = record
			tab 	: array [arraymin..arraymax] of kehilangan;
			neff 	: integer;
		end;
		
implementation
	
	
end.
			
		
		
			
