# 🌸 Diary App – Flutter CRUD Application

Diary App adalah aplikasi **catatan harian (Diary)** berbasis **Flutter** yang dirancang sederhana, modern, dan mudah digunakan.  
Aplikasi ini memungkinkan pengguna untuk **melakukan Login & Register** serta **mengelola diary secara lokal** menggunakan **SQLite (sqflite)**.

Project ini dibuat untuk memenuhi tugas **CRUD (Create, Read, Update, Delete)** pada mata kuliah **Pemrograman Mobile**.

---

## 🖼️ Screenshot Aplikasi

### 🔐 Halaman Login
Halaman awal aplikasi untuk autentikasi pengguna sebelum mengakses fitur diary.

![Login Page](screenshots/login.png)

---

### 📝 Halaman Register
Digunakan untuk membuat akun baru yang akan disimpan ke database lokal (SQLite).

![Register Page](screenshots/register.png)

---

### 📋 Halaman List Diary
Menampilkan daftar seluruh diary yang telah dibuat oleh pengguna.

![List Diary](screenshots/list_diary.png)

---

### ➕ Halaman Tambah Diary
Digunakan untuk menambahkan diary baru dengan judul dan isi catatan.

![Tambah Diary](screenshots/add_diary.png)

---

### ✏️ Halaman Edit Diary
Digunakan untuk mengedit diary yang sudah tersimpan sebelumnya.

![Edit Diary](screenshots/edit_diary.png)

---

## 👤 Informasi Pengembang

| Keterangan | Detail |
|---------|-------|
| Nama | Lita Alentina |
| NIM | 23552011097 |
| Mata Kuliah | Pemrograman Mobile 2 |
| Framework | Flutter |

---

## 📱 Deskripsi Aplikasi

Diary App membantu pengguna untuk:
- Login dan register secara lokal
- Menulis catatan harian pribadi
- Mengedit isi diary kapan saja
- Menghapus diary yang tidak diperlukan
- Menyimpan data secara aman langsung di perangkat (offline)

Aplikasi memiliki desain **modern dan estetik** dengan:
- Background image
- AppBar dengan gradient
- Form transparan warna pastel

---

## 🔐 Fitur Login & Register

### ✅ Register
- Pengguna membuat akun baru
- Data username dan password disimpan ke SQLite

### ✅ Login
- Pengguna login menggunakan akun terdaftar
- Data diverifikasi dari database lokal
- Jika valid, diarahkan ke halaman utama diary

📌 Sistem autentikasi **tidak menggunakan backend / cloud**, sesuai ketentuan tugas.

---

## ✨ Fitur Utama

- Login & Register User
- Create Diary
- Read Diary
- Update Diary
- Delete Diary
- Local Storage (SQLite / sqflite)
- UI Modern & Responsif

---

## 🛠️ Teknologi yang Digunakan

- Flutter
- Dart
- sqflite (SQLite Local Database)
- path_provider
- Material Design

---

## 📂 Implementasi CRUD

| Operasi | Implementasi |
|------|-------------|
| Create | Register User, Tambah Diary |
| Read | Login User, List Diary |
| Update | Edit Diary |
| Delete | Hapus Diary |
| Storage | SQLite (Local Storage) |

---

## 📌 Catatan

- Aplikasi bersifat **offline**
- Tidak menggunakan hosting atau cloud
- Data disimpan secara lokal sesuai ketentuan tugas

---

## 📎 Repository GitHub

🔗 https://github.com/LitaAlentina287/diary-app-crud
