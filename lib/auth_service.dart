import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/'; // For Android Emulator

  // Sign-up method
  Future<void> signup(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}signup/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode != 201) {
      throw Exception("Sign-up failed: ${response.body}");
    }
  }

  // Login method
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);  // Returns access, refresh, and username
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}
