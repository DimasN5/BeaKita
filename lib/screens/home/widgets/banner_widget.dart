import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                const Text(
                  "Find Your Dream\nScholarship",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "Explore hundreds of scholarships\nfrom trusted organizations.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),

                SizedBox(
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      "Explore",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

          const Expanded(
            child: Icon(
              Icons.school,
              size: 80,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}