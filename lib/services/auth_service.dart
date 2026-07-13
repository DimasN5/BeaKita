import 'api_service.dart';

class AuthService {
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final data = await ApiService.post('/auth/login', {
      'email': email,
      'password': password,
    });
    await ApiService.saveToken(data['token']);
    return data;
  }

  static Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final data = await ApiService.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
    await ApiService.saveToken(data['token']);
    return data;
  }

  static Future<Map<String, dynamic>> getProfile() async {
    return ApiService.get('/auth/me', auth: true);
  }

  static Future<void> logout() async {
    await ApiService.removeToken();
  }
}
