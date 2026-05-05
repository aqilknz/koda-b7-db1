CREATE TABLE kategori (
    kategori_id SERIAL PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL
);

CREATE TABLE rak_buku (
    rak_id SERIAL PRIMARY KEY,
    nama_rak VARCHAR(50) NOT NULL,
    kapasitas INT
);

CREATE TABLE petugas (
    petugas_id SERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    gmail VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE buku (
    buku_id SERIAL PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    penulis VARCHAR(100),
    kategori_id INT,
    rak_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategori(kategori_id),
    FOREIGN KEY (rak_id) REFERENCES rak_buku(rak_id) 
);

CREATE TABLE peminjaman (
    peminjaman_id SERIAL PRIMARY KEY,
    nama_peminjam VARCHAR(100) NOT NULL,
    tanggal_peminjaman DATE NOT NULL DEFAULT CURRENT_DATE,
    tanggal_pengembalian DATE,
    buku_id INT NOT NULL,
    petugas_id INT,
    FOREIGN KEY (buku_id) REFERENCES buku(buku_id),
    FOREIGN KEY (petugas_id) REFERENCES petugas(petugas_id)
);
INSERT INTO kategori (nama_kategori) VALUES 
('Fiksi'),('Non-Fiksi'),('Teknologi'),('Sejarah'),('Biografi'),
('Komik'),('Sains'),('Agama'),('Ekonomi'),('Novel');

INSERT INTO rak_buku (nama_rak, kapasitas) VALUES 
('Rak A1', 50),('Rak A2', 50),('Rak B1', 100),('Rak B2', 100),
('Rak C1', 75),('Rak C2', 75),('Rak D1', 60),('Rak D2', 60),
('Rak E1', 80),('Rak E2', 80);

INSERT INTO petugas (nama, gmail, password) VALUES
('Ahmad Aqil', 'khairunnz455@gmail.com', '12345'),
('Khairun Nadzar', 'aqilknz123@gmail.com', '12252');

INSERT INTO buku (judul, penulis, kategori_id, rak_id) VALUES 
('Laskar Pelangi', 'Andrea Hirata', 1, 1),
('Bumi Manusia', 'Pramoedya Ananta Toer', 1, 1),
('Clean Code', 'Robert C. Martin', 3, 3),
('The Pragmatic Programmer', 'Andrew Hunt', 3, 3),
('Introduction to Algorithms', 'Thomas H. Cormen', 3, 3),
('Biografi Soekarno', 'Cindy Adams', 5, 5),
('Steve Jobs', 'Walter Isaacson', 5, 5),
('A Brief History of Time', 'Stephen Hawking', 7, 7),
('Cosmos', 'Carl Sagan', 7, 7),
('Negeri 5 Menara', 'A. Fuadi', 10, 10);

INSERT INTO peminjaman (nama_peminjam, tanggal_peminjaman, tanggal_pengembalian, buku_id, petugas_id) VALUES 
('Rudi Hartono', '2026-05-01', '2026-05-08', 1, 1),
('Ani Yudhoyono', '2026-05-01', '2026-05-08', 2, 2),
('Joko Widodo', '2026-05-02', '2026-05-09', 3, 1),
('Megawati', '2026-05-02', '2026-05-09', 4, 1),
('Susilo Bambang', '2026-05-03', '2026-05-10', 5, 2),
('Maia Estianty', '2026-05-03', '2026-05-10', 6, 2),
('Ahmad Dhani', '2026-05-04', NULL, 7, 1),
('Iwan Fals', '2026-05-04', NULL, 8, 2),
('Rais Aam', '2026-05-05', '2026-05-12', 9, 1),
('Dian Sastro', '2026-05-05', '2026-05-12', 10, 1);

table kategori;
table rak_buku;
table petugas;
table buku;
table peminjaman;

