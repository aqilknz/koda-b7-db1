DROP TABLE IF EXISTS peminjaman CASCADE;
DROP TABLE IF EXISTS buku CASCADE;
DROP TABLE IF EXISTS petugas CASCADE;
DROP TABLE IF EXISTS rak_buku CASCADE;
DROP TABLE IF EXISTS kategori CASCADE;
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
('Fiksi'),('Teknologi'),('Sejarah'),('Fiksi'),
('Teknologi'),('Sejarah'),('Fiksi'),('Teknologi'),
('Sejarah'),('Teknologi');

INSERT INTO petugas (nama, gmail, password) VALUES
('Ahmad Aqil', 'khairunnz455@gmail.com', '12345'),
('Khairun Nadzar', 'aqilknz123@gmail.com', '12252'),

TRUNCATE TABLE kategori RESTART IDENTITY CASCADE;
SELECT * FROM kategori;
SELECT * FROM petugas;

