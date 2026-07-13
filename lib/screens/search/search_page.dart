import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/filter_model.dart';
import '../../models/scholarship_model.dart';
import '../../providers/scholarship_provider.dart';
import '../../utils/app_colors.dart';
import '../detail/detail_page.dart';
import '../home/widgets/bottom_navbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  List<ScholarshipModel> filteredList = [];
  FilterModel currentFilter = const FilterModel(category: "All", funding: "All", location: "All");

  @override
  void initState() {
    super.initState();
    final provider = context.read<ScholarshipProvider>();
    filteredList = provider.scholarships;
    if (provider.scholarships.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        provider.fetchScholarships();
      });
    }
  }

  void searchScholarship(String keyword) { filterScholarship(keyword, currentFilter); }

  void filterScholarship(String keyword, FilterModel filter) {
    setState(() {
      currentFilter = filter;
      final provider = context.read<ScholarshipProvider>();
      filteredList = provider.scholarships.where((item) {
        final matchKeyword = keyword.isEmpty ||
            item.title.toLowerCase().contains(keyword.toLowerCase()) ||
            item.organization.toLowerCase().contains(keyword.toLowerCase());
        final matchCategory = filter.category == "All" ? true : item.category == filter.category;
        final matchFunding = filter.funding == "All" ? true : item.funding == filter.funding;
        final matchLocation = filter.location == "All" ? true : item.location == filter.location;
        return matchKeyword && matchCategory && matchFunding && matchLocation;
      }).toList();
    });
  }

  Future<void> openFilter() async {
    final result = await showModalBottomSheet<FilterModel>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (_) => FilterBottomSheet(currentFilter: currentFilter),
    );
    if (result != null) { filterScholarship(searchController.text, result); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNavbar(selectedIndex: 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0,
        title: const Text("Search Scholarship", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchScholarship,
              decoration: InputDecoration(
                hintText: "Search scholarship...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(icon: const Icon(Icons.tune), onPressed: openFilter),
                filled: true, fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("${filteredList.length} Scholarship Found", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: filteredList.isEmpty
                  ? const EmptySearch()
                  : ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 15),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: CircleAvatar(
                              radius: 28,
                              backgroundColor: AppColors.primary.withOpacity(.15),
                              child: const Icon(Icons.school, color: AppColors.primary),
                            ),
                            title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Text(item.organization, style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 6),
                                Text(item.deadline, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(color: AppColors.primary.withOpacity(.1), borderRadius: BorderRadius.circular(20)),
                                      child: Text(item.category, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(color: Colors.green.withOpacity(.1), borderRadius: BorderRadius.circular(20)),
                                      child: Text(item.funding, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Consumer<ScholarshipProvider>(
                              builder: (context, provider, _) {
                                return IconButton(
                                  icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                                  onPressed: () async {
                                    await provider.toggleFavorite(item);
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(scholarship: item))); },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 70, color: Colors.grey),
          SizedBox(height: 20),
          Text("Scholarship Not Found", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 8),
          Text("Try another keyword or filter.", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final FilterModel currentFilter;
  const FilterBottomSheet({super.key, required this.currentFilter});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late String category;
  late String funding;
  late String location;

  @override
  void initState() {
    super.initState();
    category = widget.currentFilter.category;
    funding = widget.currentFilter.funding;
    location = widget.currentFilter.location;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(20)))),
              const SizedBox(height: 20),
              const Center(child: Text("Filter Scholarship", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
              const SizedBox(height: 30),
              buildTitle("Category"), const SizedBox(height: 10),
              Wrap(spacing: 10, runSpacing: 10, children: [
                buildChip("All", category), buildChip("S1", category), buildChip("S2", category), buildChip("S2/S3", category),
              ]),
              const SizedBox(height: 30),
              buildTitle("Funding"), const SizedBox(height: 10),
              Wrap(spacing: 10, runSpacing: 10, children: [
                buildFundingChip("All"), buildFundingChip("Fully Funded"), buildFundingChip("Partial"),
              ]),
              const SizedBox(height: 30),
              buildTitle("Location"), const SizedBox(height: 10),
              Wrap(spacing: 10, runSpacing: 10, children: [
                buildLocationChip("All"), buildLocationChip("Indonesia"), buildLocationChip("Indonesia & Overseas"),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                Expanded(child: OutlinedButton(onPressed: () { setState(() { category = "All"; funding = "All"; location = "All"; }); }, child: const Text("Reset"))),
                const SizedBox(width: 15),
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 50)),
                  onPressed: () { Navigator.pop(context, FilterModel(category: category, funding: funding, location: location)); },
                  child: const Text("Apply", style: TextStyle(fontWeight: FontWeight.bold)),
                )),
              ]),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget buildChip(String value, String selected) {
    return ChoiceChip(
      label: Text(value),
      selected: selected == value,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(color: selected == value ? Colors.white : Colors.black, fontWeight: FontWeight.w600),
      onSelected: (_) { setState(() { category = value; }); },
    );
  }

  Widget buildFundingChip(String value) {
    return ChoiceChip(
      label: Text(value),
      selected: funding == value,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(color: funding == value ? Colors.white : Colors.black),
      onSelected: (_) { setState(() { funding = value; }); },
    );
  }

  Widget buildLocationChip(String value) {
    return ChoiceChip(
      label: Text(value),
      selected: location == value,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(color: location == value ? Colors.white : Colors.black),
      onSelected: (_) { setState(() { location = value; }); },
    );
  }
}
