import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'diary.dart';
import 'diary_db.dart';
import 'diary_form_page.dart';
import 'login_page.dart';

class DiaryListPage extends StatefulWidget {
  const DiaryListPage({super.key});

  @override
  State<DiaryListPage> createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {
  List<Diary> diaries = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    diaries = await DiaryDb.instance.getAll();
    if (mounted) {
      setState(() => loading = false);
    }
  }

  Future<void> _logout() async {
    await AuthService.logout();
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  void _openForm({Diary? diary}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DiaryFormPage(diary: diary),
      ),
    );

    if (result == true) {
      setState(() => loading = true);
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildGradientAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD81B60),
        onPressed: () => _openForm(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Stack(
        children: [
          /// BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'assets/images/home.png',
              fit: BoxFit.cover,
            ),
          ),

          /// OVERLAY
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          /// CONTENT
          SafeArea(
            child: loading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : diaries.isEmpty
                    ? const Center(
                        child: Text(
                          'Belum ada diary',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: diaries.length,
                        itemBuilder: (_, index) {
                          final diary = diaries[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                diary.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                diary.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () => _openForm(diary: diary),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  await DiaryDb.instance.delete(diary.id!);
                                  setState(() => loading = true);
                                  _loadData();
                                },
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  /// ================= GRADIENT APP BAR =================
  PreferredSizeWidget _buildGradientAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 4,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFFD81B60),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'My Diary',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: _logout,
        ),
      ],
    );
  }

  /// ================= DRAWER =================
  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6A1B9A),
                  Color(0xFFD81B60),
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Diary App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Semua Diary'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Tambah Diary'),
            onTap: () {
              Navigator.pop(context);
              _openForm();
            },
          ),

          const Divider(),

          /// ===== ABOUT APP =====
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Tentang Aplikasi'),
                  content: const Text(
                    'Diary App adalah aplikasi catatan harian '
                    'yang digunakan untuk mencatat kegiatan, pengalaman, atau '
                    'hal penting secara pribadi.\n\n'
                    'Aplikasi ini menyediakan '
                    'fitur login, tambah diary, edit, dan hapus catatan.\n\n'
                    'Dibuat oleh:\n'
                    'Nama  : Lita Alentina\n'
                    'NIM   : 23552011097\n'
                    'Kelas : TIF K 23B\n\n'
                    'Teknologi:\n'
                    '- Flutter\n'
                    '- SQLite (Local Database)',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
