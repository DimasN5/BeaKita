import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../home/widgets/bottom_navbar.dart';
import 'widgets/logout_card.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_menu.dart';
import 'widgets/profile_stats.dart';

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
        centerTitle: false,
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// 1. Bagian Atas dipaksa ke Tengah (Center)
              const Center(
                child: ProfileAvatar(),
              ),

              const SizedBox(height: 35),

              /// 2. Bagian Statistik
              const ProfileStats(),

              const SizedBox(height: 35),

              /// 3. Judul Kategori (Rata Kiri secara spesifik menggunakan Align)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 12),
                  child: Text(
                    "PENGATURAN AKUN",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5C6070),
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),

              /// 4. Menu Utama (Bubble Putih)
              const ProfileMenu(),

              const SizedBox(height: 25),

              /// 5. Tombol Keluar Akun
              const LogoutCard(),

              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }
}