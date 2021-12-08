import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static UserPreferences? _instance;

  static UserPreferences get instance => _instance!;

  late SharedPreferences _sharedPreferences;

  UserPreferences._();

  static initialize() async {
    _instance ??= UserPreferences._();
    _instance!._sharedPreferences = await SharedPreferences.getInstance();
  }

  saveToke(String token) {
    _sharedPreferences.setString("token", token);
  }
}
