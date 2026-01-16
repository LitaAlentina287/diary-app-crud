# 🌸 Diary App – Flutter CRUD Application

## Screenshot Aplikasi

### 1️⃣ Halaman Login
Halaman awal aplikasi yang digunakan pengguna untuk masuk ke aplikasi.
Pengguna memasukkan username dan password yang telah dibuat sebelumnya.

Jika data sesuai, pengguna akan diarahkan ke halaman utama aplikasi.
Status login pengguna kemudian disimpan menggunakan SharedPreferences untuk menjaga sesi login selama aplikasi digunakan.

![Login Page](screenshots/1login.png)

---

### 2️⃣ Halaman Register
Halaman untuk **mendaftarkan akun baru**.  
Data pengguna disimpan secara lokal ke database SQLite tanpa koneksi internet.

![Register Page](screenshots/2register.png)

---

### 3️⃣ Halaman List Diary
Menampilkan **daftar seluruh diary** yang telah dibuat oleh pengguna setelah berhasil login.  
Pengguna dapat memilih diary untuk diedit atau dihapus.

![List Diary](screenshots/3list_diary.png)

---

### 4️⃣ Halaman Tambah Diary
Halaman untuk **menambahkan diary baru** dengan judul dan isi catatan.  
Data diary akan disimpan ke database SQLite.

![Tambah Diary](screenshots/4tambah_diary.png)

---

### 5️⃣ Halaman Edit Diary
Digunakan untuk **mengubah isi diary** yang sudah tersimpan sebelumnya.  
Pengguna dapat memperbarui judul maupun isi catatan.

![Edit Diary](screenshots/5edit_diary.png)

---

### 6️⃣ Fitur Hapus Diary
Fitur untuk **menghapus diary** yang tidak diperlukan.  
Diary yang dihapus akan langsung terhapus dari database lokal.

![Hapus Diary](screenshots/6hapus.png)

---

### 7️⃣ Halaman Tentang Aplikasi
Menampilkan **informasi aplikasi**, tujuan pembuatan, serta identitas pengembang.  
Halaman ini membantu pengguna memahami fungsi dan kegunaan aplikasi.

![Tentang Aplikasi](screenshots/7tentang_aplikasi.png)

---

## 📱 Tentang Aplikasi

Diary App adalah aplikasi **catatan harian (Diary)** berbasis **Flutter** yang dirancang sederhana, modern, dan mudah digunakan.  
Aplikasi ini memungkinkan pengguna untuk **melakukan Login & Register** serta **mengelola diary secara lokal** menggunakan **SQLite (sqflite)**.

Project ini dibuat untuk memenuhi tugas **CRUD (Create, Read, Update, Delete)** pada mata kuliah **Pemrograman Mobile**.

---

## 👤 Informasi Pengembang

| Keterangan | Detail |
|----------|--------|
| Nama | Lita Alentina |
| NIM | 23552011097 |
| Mata Kuliah | Pemrograman Mobile 2 |
| Framework | Flutter |

---

## ✨ Fitur Utama

- 🔐 Login & Register User
- ➕ Create Diary
- 📋 Read Diary
- ✏️ Update Diary
- 🗑️ Delete Diary
- 💾 Local Storage (SQLite / sqflite)
- 🔐 Session Login (SharedPreferences)
- 🎨 UI Modern & Estetik

---

## 🔐 Penjelasan Login, Register & SharedPreferences

### ✅ Register
- Pengguna membuat akun baru
- Data username dan password disimpan ke **database lokal SQLite**

### ✅ Login
- Pengguna login menggunakan akun terdaftar
- Data diverifikasi dari database lokal SQLite
- Jika valid, pengguna diarahkan ke halaman utama diary

### ✅ SharedPreferences (Session Management)
Aplikasi ini menggunakan **SharedPreferences** untuk:
- Menyimpan **status login pengguna**
- Menyimpan **username user yang sedang aktif**
- Mendukung fitur **auto login** saat aplikasi dibuka kembali

📌 **SharedPreferences hanya digunakan untuk data kecil (session login)**  
📌 **Data utama seperti user dan diary tetap disimpan di SQLite**

Sistem autentikasi **tidak menggunakan backend, API, atau cloud**,  
sesuai dengan ketentuan tugas **local storage sederhana**.

---

## 🛠️ Teknologi yang Digunakan

- Flutter
- Dart
- sqflite (SQLite Local Database)
- shared_preferences
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
| Session | SharedPreferences |

---

## 📌 Catatan Penting

- Aplikasi bersifat **offline**
- Tidak menggunakan hosting, API, atau cloud
- Seluruh data disimpan secara **local storage**
- SharedPreferences digunakan hanya untuk **manajemen session login**

---

## 📎 Repository GitHub

🔗 https://github.com/LitaAlentina287/diary-app-crud
