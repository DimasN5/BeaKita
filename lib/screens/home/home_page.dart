import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/scholarship_provider.dart';
import '../../utils/app_colors.dart';
import 'widgets/banner_widget.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/category_section.dart';
import 'widgets/greeting_section.dart';
import 'widgets/scholarship_card.dart';
import 'widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ScholarshipProvider>().fetchScholarships();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNavbar(selectedIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingSection(),
              const SizedBox(height: 25),
              const SearchBarWidget(),
              const SizedBox(height: 20),
              const BannerWidget(),
              const SizedBox(height: 30),
              const CategorySection(),
              const SizedBox(height: 35),
              const Text("Recommended Scholarship", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),
              Consumer<ScholarshipProvider>(
                builder: (context, provider, _) {
                  final list = provider.scholarships.take(3).toList();
                  return Column(
                    children: list.map((item) => ScholarshipCard(scholarship: item)).toList(),
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text("Popular Scholarship", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),
              Consumer<ScholarshipProvider>(
                builder: (context, provider, _) {
                  final list = provider.scholarships.skip(2).toList();
                  return Column(
                    children: list.map((item) => ScholarshipCard(scholarship: item)).toList(),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
