create database coba;

create table beasiswa(
    id_beasiswa varchar(10) primary key,
    jenis_beasiswa varchar(50),
    dana int
);

create type jenis_kelamin AS ENUM('L','P');

create table siswa(
    id_siswa int primary key,
    nama varchar(255),
    tgl_lahir date,
    jenis_kelamin enum_type,
    alamat varchar(255),
    sekolah varchar(255),
    id_beasiswa varchar(10),
    CONSTRAINT fk_beasiswa FOREIGN KEY (id_beasiswa) REFERENCES beasiswa(id_beasiswa)
);

create table author(
    id_author int primary key,
    nama_author varchar(255),
    nomor_telp int,
    pendidikan varchar(50),
    jenis_kelamin enum_type
);

create table buku(
    kode_buku varchar(5) primary key,
    judul_buku varchar(255),
    isbn int,
    penerbit varchar(255),
    tahun_terbit int,
    id_author int,
    CONSTRAINT fk_author FOREIGN KEY (id_author) REFERENCES author(id_author)
);

create table course(
    id_course varchar(10) primary key,
    nama_course varchar(255),
    rating int,
    tingkat varchar(15)
);

create table student_course_enrollment(
    id_enrollment int primary key,
    id_siswa int,
    CONSTRAINT fk_siswa FOREIGN KEY (id_siswa) REFERENCES siswa(id_siswa),
    id_course varchar(10),
    CONSTRAINT fk_course FOREIGN KEY (id_course) REFERENCES course(id_course),
    tgl_mulai date,
    tgl_berakhir date
);

INSERT INTO beasiswa (id_beasiswa, jenis_beasiswa, dana) VALUES ('BEA001', 'Prestasi Akademik', 3000000), 
('BEA002', 'Non-Akademik', 2000000), ('BEA003', 'Miskin', 1000000);

INSERT INTO siswa (id_siswa, nama, tgl_lahir, jenis_kelamin, alamat, sekolah, id_beasiswa) 
VALUES (180001, 'Shania Risky Agustin','28-04-2000' , 'P', 'jl.Flamboyan Blok D No.10, Bekasi', 'SMAN 9 Bekasi','BEA002'), 
(180002, 'Dhimas Pandu Yogaswara','01-08-2001' , 'L', 'jl.Mustika Jaya Blok A No.10, Bekasi', 'SMAN 1 Bekasi','BEA001'),
(180003, 'Hosea Leonardo','05-11-2004' , 'L', 'jl.Mawar Blok F No.15, Jakarta Timur', 'SMAN 27 Jakarta', 'BEA003');

INSERT INTO author (id_author,nama_author, nomor_telp, pendidikan, jenis_kelamin) 
VALUES (190001, 'Shania Risky Agustin',08594558 , 'S1 Teknik Informatika', 'P'), 
(190002, 'Dhimas Pandu Yogaswara',08123456 , 'D3 Komputer', 'L'),
(190003, 'Hosea Leonardo',08542134 , 'S2 Ekonomi', 'L');

INSERT INTO buku (kode_buku, judul_buku, isbn, penerbit, tahun_terbit, id_author) 
VALUES ('IF001', 'Belajar Javascript untuk Pemula',978602875 , 'Sinar Mulya', 2009, 190001), 
('AK002', 'Tutorial Service Komputer Lengkap',978602802 , 'Amanah Jaya', 2022, 190002),
('EK003', 'Ekonomi Sulit di Indonesia',978602804 , 'Gramedia', 2019, 190003);

INSERT INTO course (id_course, nama_course, rating, tingkat) 
VALUES ('ING001', 'Inggris', 5, 'Beginner'), 
('KOM002', 'Komputer', 4, 'Intermediate'),
('MTK003', 'Matematika',3, 'Expert');

INSERT INTO student_course_enrollment (id_enrollment, id_siswa, id_course, tgl_mulai, tgl_berakhir) 
VALUES (001, 180001,'ING001' , '01-01-2023', '01-02-2023'), 
(002, 180002,'KOM002' , '01-02-2023', '01-04-2023'),
(003, 180003,'MTK003' , '01-03-2023', '01-06-2023');

UPDATE beasiswa SET jenis_beasiswa = 'Kurang Mampu' WHERE id_beasiswa = 'BEA003';

UPDATE siswa SET sekolah = 'SMAN 17 Jakarta' WHERE id_siswa = 180003;

UPDATE author SET nomor_telp = 08333567 WHERE id_author = 190003;

UPDATE buku SET tahun_terbit = 2020 WHERE kode_buku = 'IF001';

UPDATE course SET nama_course = 'Bahasa Inggris' WHERE id_course = 'ING001';

UPDATE student_course_enrollment SET tgl_berakhir = '01-05-2023' WHERE id_enrollment = 003;

DELETE FROM siswa WHERE id_siswa = 180003;

DELETE FROM buku WHERE kode_buku = 'EK003';

DELETE FROM student_course_enrollment WHERE id_enrollment = 003;

DELETE FROM beasiswa WHERE id_beasiswa = 'BEA003';

DELETE FROM author WHERE id_author = 190003;

DELETE FROM course WHERE id_course = 'MTK003';

select * from beasiswa;
select * from siswa;
select * from author;
select * from buku;
select * from course;
select * from student_course_enrollment;