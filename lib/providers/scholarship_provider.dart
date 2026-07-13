import 'package:flutter/material.dart';

import '../models/filter_model.dart';
import '../models/scholarship_model.dart';
import '../services/scholarship_service.dart';

class ScholarshipProvider extends ChangeNotifier {
  List<ScholarshipModel> _scholarships = [];
  List<ScholarshipModel> _favorites = [];
  bool _loading = false;
  String? _error;

  String _keyword = "";
  FilterModel _filter = const FilterModel(
    category: "All",
    funding: "All",
    location: "All",
  );

  List<ScholarshipModel> get scholarships => _scholarships;
  List<ScholarshipModel> get favorites => _favorites;
  bool get loading => _loading;
  String? get error => _error;
  FilterModel get currentFilter => _filter;

  List<ScholarshipModel> get filteredScholarships {
    return _scholarships.where((item) {
      final matchKeyword = _keyword.isEmpty ||
          item.title.toLowerCase().contains(_keyword.toLowerCase()) ||
          item.organization.toLowerCase().contains(_keyword.toLowerCase());
      final matchCategory = _filter.category == "All" ? true : item.category == _filter.category;
      final matchFunding = _filter.funding == "All" ? true : item.funding == _filter.funding;
      final matchLocation = _filter.location == "All" ? true : item.location == _filter.location;
      return matchKeyword && matchCategory && matchFunding && matchLocation;
    }).toList();
  }

  Future<void> fetchScholarships() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await ScholarshipService.getScholarships(
        keyword: _keyword,
        category: _filter.category,
        funding: _filter.funding,
        location: _filter.location,
      );
      _scholarships = data.map((e) => _fromJson(e)).toList();
    } catch (e) {
      _error = 'Gagal memuat data beasiswa';
    }

    _loading = false;
    notifyListeners();
  }

  Future<void> fetchFavorites() async {
    try {
      final data = await ScholarshipService.getFavorites();
      _favorites = data.map((e) => _fromJson(e)).toList();
    } catch (_) {}
    notifyListeners();
  }

  Future<void> toggleFavorite(ScholarshipModel scholarship) async {
    final id = scholarship.id;
    if (scholarship.isFavorite) {
      await ScholarshipService.removeFavorite(id);
      _favorites.removeWhere((e) => e.id == id);
    } else {
      await ScholarshipService.addFavorite(id);
      _favorites.add(scholarship);
    }
    scholarship.toggleFavorite();
    notifyListeners();
  }

  void search(String keyword) {
    _keyword = keyword;
    fetchScholarships();
  }

  void applyFilter(FilterModel filter) {
    _filter = filter;
    fetchScholarships();
  }

  void resetFilter() {
    _filter = const FilterModel(category: "All", funding: "All", location: "All");
    _keyword = "";
    fetchScholarships();
  }

  ScholarshipModel _fromJson(Map<String, dynamic> json) {
    return ScholarshipModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      organization: json['organization'] ?? '',
      deadline: _formatDate(json['deadline']),
      category: json['category'] ?? '',
      funding: json['funding'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      requirement: json['requirement'] ?? '',
      benefit: json['benefit'] ?? '',
      website: json['website'] ?? '',
      isFavorite: _favorites.any((f) => f.id == json['_id']),
    );
  }

  String _formatDate(dynamic date) {
    if (date == null) return '';
    final d = DateTime.parse(date.toString());
    final months = [
      '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${d.day} ${months[d.month]} ${d.year}';
  }
}
