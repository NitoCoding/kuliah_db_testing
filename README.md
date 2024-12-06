
# PostgreSQL Database Setup: dvdrental

Repository ini berisi instruksi untuk mengimpor database contoh `dvdrental` ke dalam server PostgreSQL lokal Anda.

## Database

**Nama Database:** `dvdrental`  
**Sumber Database:** [PostgreSQL Sample Database](https://neon.tech/postgresql/postgresql-getting-started/postgresql-sample-database)

## Langkah-Langkah Instalasi

Ikuti langkah-langkah berikut untuk memasukkan database ke server PostgreSQL Anda:

### 1. Masuk ke PostgreSQL
Buka terminal dan jalankan perintah berikut untuk masuk ke PostgreSQL:

```bash
psql -U postgres
```

### 2. Membuat Database
Buat database bernama `dvdrental`:

```sql
CREATE DATABASE dvdrental;
```

Setelah itu, keluar dari sesi PostgreSQL dengan perintah:

```bash
\q
```

### 3. Mengimpor Database
Gunakan file `restore.sql` untuk mengimpor data ke database `dvdrental`. Jalankan perintah berikut di terminal:

```bash
psql -U postgres -d dvdrental -f restore.sql
```

## Verifikasi
Untuk memastikan bahwa database telah berhasil diimpor, masuk kembali ke PostgreSQL dan pilih database `dvdrental`:

```bash
psql -U postgres
\c dvdrental
\dt
```

Perintah `\dt` akan menampilkan daftar tabel dalam database `dvdrental`.

---

Jika ada masalah selama proses instalasi, silakan hubungi pengelola repositori atau periksa dokumentasi PostgreSQL untuk solusi lebih lanjut.
