import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffEAEAEA),
                child: Icon(
                  Icons.person,
                  size: 65,
                  color: Colors.grey,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: -2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
                padding: const EdgeInsets.all(7),
                child: const Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        const Text(
          "Nama Calon Penerus Bangsa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 5),

        const Text(
          "Mahasiswa S1 • Universitas Ahmad Dahlan",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 22),

        SizedBox(
          width: 170,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),

            child: const Text(
              "Ubah Profil",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}