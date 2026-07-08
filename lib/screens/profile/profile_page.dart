import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../home/widgets/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      bottomNavigationBar: const BottomNavbar(
        selectedIndex: 3,
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // FOTO PROFILE
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 65,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Farah Mukti",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "farah@email.com",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 35),

            buildMenu(
              Icons.favorite,
              "Favorite Scholarship",
              Colors.red,
            ),

            buildMenu(
              Icons.notifications,
              "Notifications",
              Colors.orange,
            ),

            buildMenu(
              Icons.settings,
              "Settings",
              Colors.blue,
            ),

            buildMenu(
              Icons.help_outline,
              "Help Center",
              Colors.green,
            ),

            buildMenu(
              Icons.info_outline,
              "About BeaKita",
              Colors.purple,
            ),

            buildMenu(
              Icons.logout,
              "Logout",
              Colors.redAccent,
            ),

          ],
        ),
      ),
    );
  }

  Widget buildMenu(
      IconData icon,
      String title,
      Color color,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 17,
        ),

        onTap: () {},
      ),
    );
  }
}