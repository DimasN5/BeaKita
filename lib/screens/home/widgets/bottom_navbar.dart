import 'package:flutter/material.dart';

import '../../favorite/favorite_page.dart';
import '../../home/home_page.dart';
import '../../profile/profile_page.dart';
import '../../search/search_page.dart';
import '../../../utils/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,

      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,

      onTap: (index) {
        if (index == selectedIndex) return;

        Widget page;

        switch (index) {
          case 0:
            page = const HomePage();
            break;
          case 1:
            page = const SearchPage();
            break;
          case 2:
            page = const FavoritePage();
            break;
          default:
            page = const ProfilePage();
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favorite",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}