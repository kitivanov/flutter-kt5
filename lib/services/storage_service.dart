import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class StorageService {
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);
    await prefs.setBool('authorized', true);
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final authorized =
        prefs.getBool('authorized') ?? false;

    if (!authorized) return null;

    return User(
      name: prefs.getString('name') ?? '',
      email: prefs.getString('email') ?? '',
    );
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}