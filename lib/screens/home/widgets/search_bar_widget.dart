import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: TextField(
        decoration: InputDecoration(
          hintText: "Search scholarship...",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),

          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),

          suffixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}