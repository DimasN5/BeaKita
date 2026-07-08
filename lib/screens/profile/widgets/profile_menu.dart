import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Menu 1: Informasi Pribadi
          _buildMenuItem(
            icon: Icons.person_outline_rounded,
            title: "Informasi Pribadi",
            isFirst: true,
            onTap: () {},
          ),
          _buildDivider(),

          // Menu 2: Biodata Pendidikan
          _buildMenuItem(
            icon: Icons.school_outlined,
            title: "Biodata Pendidikan",
            onTap: () {},
          ),
          _buildDivider(),

          // Menu 3: Dokumen Tersimpan
          _buildMenuItem(
            icon: Icons.folder_open_rounded,
            title: "Dokumen Tersimpan",
            onTap: () {},
          ),
          _buildDivider(),

          // Menu 4: Notifikasi & Pengingat
          _buildMenuItem(
            icon: Icons.notifications_none_rounded,
            title: "Notifikasi & Pengingat",
            showBadge: true,
            onTap: () {},
          ),
          _buildDivider(),

          // Menu 5: Ganti Password
          _buildMenuItem(
            icon: Icons.lock_outline_rounded,
            title: "Ganti Password",
            isLast: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isFirst = false,
    bool isLast = false,
    bool showBadge = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isFirst ? const Radius.circular(20) : Radius.zero,
        bottom: isLast ? const Radius.circular(20) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF1A2B4C), size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2B4C),
                ),
              ),
            ),
            if (showBadge)
              Container(
                margin: const EdgeInsets.only(right: 12),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Color(0xFF8A94A6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF5F6F9),
      ),
    );
  }
}