import 'api_service.dart';

class ScholarshipService {
  static Future<List<dynamic>> getScholarships({
    String keyword = '',
    String category = 'All',
    String funding = 'All',
    String location = 'All',
  }) async {
    final params = <String, String>{};
    if (keyword.isNotEmpty) params['keyword'] = keyword;
    if (category != 'All') params['category'] = category;
    if (funding != 'All') params['funding'] = funding;
    if (location != 'All') params['location'] = location;

    final query = params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&');
    final data = await ApiService.get('/scholarships${query.isNotEmpty ? '?$query' : ''}');
    return data['scholarships'];
  }

  static Future<Map<String, dynamic>> getScholarshipById(String id) async {
    final data = await ApiService.get('/scholarships/$id');
    return data['scholarship'];
  }

  static Future<List<dynamic>> getFavorites() async {
    final data = await ApiService.get('/favorites', auth: true);
    return data['favorites'];
  }

  static Future<void> addFavorite(String scholarshipId) async {
    await ApiService.post('/favorites', {'scholarshipId': scholarshipId}, auth: true);
  }

  static Future<void> removeFavorite(String scholarshipId) async {
    await ApiService.delete('/favorites', body: {'scholarshipId': scholarshipId}, auth: true);
  }
}
