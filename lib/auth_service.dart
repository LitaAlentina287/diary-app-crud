import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String keyLogin = 'is_login';
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyLogin) ?? false;
  }

  static Future<void> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final savedUser = prefs.getString(keyUsername);
    final savedPass = prefs.getString(keyPassword);

    if (savedUser == null || savedPass == null) {
      throw 'Akun belum terdaftar';
    }

    if (username == savedUser && password == savedPass) {
      await prefs.setBool(keyLogin, true);
    } else {
      throw 'Username atau password salah';
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyLogin, false);
  }
}
