import 'package:flutter/material.dart';

import '../../models/scholarship_model.dart';
import '../../utils/app_colors.dart';

class DetailPage extends StatelessWidget {
  final ScholarshipModel scholarship;

  const DetailPage({
    super.key,
    required this.scholarship,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [

          IconButton(
            onPressed: () {},

            icon: Icon(

              scholarship.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,

              color: Colors.red,

            ),
          ),

          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),

        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 180,

              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(22),
              ),

              child: const Center(
                child: Icon(
                  Icons.school,
                  size: 90,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              scholarship.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              scholarship.organization,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [

                const Icon(
                  Icons.calendar_today,
                  color: Colors.orange,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    scholarship.deadline,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 35),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              scholarship.description,
              style: const TextStyle(
                height: 1.7,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Requirements",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              scholarship.requirement,
              style: const TextStyle(
                height: 1.7,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Benefits",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              scholarship.benefit,
              style: const TextStyle(
                height: 1.7,
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              "Official Website",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Text(
                scholarship.website,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(
                      content: Text(
                        "Backend belum dihubungkan",
                      ),
                    ),

                  );

                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                child: const Text(
                  "Apply Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}