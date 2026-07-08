import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CategoryItem(
          icon: Icons.school,
          title: "National",
        ),
        CategoryItem(
          icon: Icons.public,
          title: "International",
        ),
        CategoryItem(
          icon: Icons.attach_money,
          title: "Funding",
        ),
        CategoryItem(
          icon: Icons.more_horiz,
          title: "More",
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 30,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}