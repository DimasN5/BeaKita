class ScholarshipModel {
  final String id;
  final String title;
  final String organization;
  final String deadline;
  final String category;
  final String funding;
  final String location;
  final String description;
  final String requirement;
  final String benefit;
  final String website;
  bool isFavorite;

  ScholarshipModel({
    required this.id,
    required this.title,
    required this.organization,
    required this.deadline,
    required this.category,
    required this.funding,
    required this.location,
    required this.description,
    required this.requirement,
    required this.benefit,
    required this.website,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
