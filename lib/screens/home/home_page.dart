import 'package:flutter/material.dart';

import '../../services/dummy_scholarship.dart';
import '../../utils/app_colors.dart';
import 'widgets/banner_widget.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/category_section.dart';
import 'widgets/greeting_section.dart';
import 'widgets/scholarship_card.dart';
import 'widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      bottomNavigationBar: const BottomNavbar(
        selectedIndex: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Greeting
              const GreetingSection(),

              const SizedBox(height: 25),

              /// Search
              const SearchBarWidget(),

              const SizedBox(height: 20),

              /// Banner
              const BannerWidget(),

              const SizedBox(height: 30),

              /// Category
              const CategorySection(),

              const SizedBox(height: 35),

              /// Recommended
              const Text(
                "Recommended Scholarship",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              ...scholarshipList
                  .take(3)
                  .map(
                    (item) => ScholarshipCard(
                      scholarship: item,
                    ),
                  ),

              const SizedBox(height: 30),

              /// Popular
              const Text(
                "Popular Scholarship",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              ...scholarshipList
                  .skip(2)
                  .map(
                    (item) => ScholarshipCard(
                      scholarship: item,
                    ),
                  ),

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}