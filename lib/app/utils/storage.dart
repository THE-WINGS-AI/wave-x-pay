import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  
  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token').toString();
    return token;
  }
}
