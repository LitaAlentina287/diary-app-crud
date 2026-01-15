import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'diary_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cek status login dari local storage (SharedPreferences)
  final bool isLogin = await AuthService.isLoggedIn();

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),

      /// JIKA SUDAH LOGIN → LANGSUNG KE LIST DIARY
      /// JIKA BELUM → HALAMAN LOGIN
      home: isLogin ? const DiaryListPage() : const LoginPage(),
    );
  }
}
