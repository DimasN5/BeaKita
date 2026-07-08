import 'package:flutter/material.dart';

import '../models/filter_model.dart';
import '../models/scholarship_model.dart';
import '../services/dummy_scholarship.dart';

class ScholarshipProvider extends ChangeNotifier {
  final List<ScholarshipModel> _scholarships = scholarshipList;

  String _keyword = "";

  FilterModel _filter = const FilterModel(
    category: "All",
    funding: "All",
    location: "All",
  );

  List<ScholarshipModel> get scholarships => _scholarships;

  List<ScholarshipModel> get filteredScholarships {
    return _scholarships.where((item) {
      final matchKeyword =
          _keyword.isEmpty ||
          item.title.toLowerCase().contains(_keyword.toLowerCase()) ||
          item.organization.toLowerCase().contains(_keyword.toLowerCase());

      final matchCategory = _filter.category == "All"
          ? true
          : item.category == _filter.category;

      final matchFunding = _filter.funding == "All"
          ? true
          : item.funding == _filter.funding;

      final matchLocation = _filter.location == "All"
          ? true
          : item.location == _filter.location;

      return matchKeyword &&
          matchCategory &&
          matchFunding &&
          matchLocation;
    }).toList();
  }

  List<ScholarshipModel> get favoriteScholarships {
    return _scholarships.where((e) => e.isFavorite).toList();
  }

  void search(String keyword) {
    _keyword = keyword;
    notifyListeners();
  }

  void applyFilter(FilterModel filter) {
    _filter = filter;
    notifyListeners();
  }

  void toggleFavorite(ScholarshipModel scholarship) {
    scholarship.toggleFavorite();
    notifyListeners();
  }

  void resetFilter() {
    _filter = const FilterModel(
      category: "All",
      funding: "All",
      location: "All",
    );

    notifyListeners();
  }

  FilterModel get currentFilter => _filter;
}