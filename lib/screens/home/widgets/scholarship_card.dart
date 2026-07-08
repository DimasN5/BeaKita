import 'package:flutter/material.dart';

import '../../../models/scholarship_model.dart';
import '../../../utils/app_colors.dart';
import '../../detail/detail_page.dart';

class ScholarshipCard extends StatefulWidget {
  final ScholarshipModel scholarship;

  const ScholarshipCard({
    super.key,
    required this.scholarship,
  });

  @override
  State<ScholarshipCard> createState() => _ScholarshipCardState();
}

class _ScholarshipCardState extends State<ScholarshipCard> {
  @override
  Widget build(BuildContext context) {
    final item = widget.scholarship;

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.school,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      item.organization,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      children: [

                        Chip(
                          label: Text(
                            item.category,
                            style: const TextStyle(fontSize: 12),
                          ),
                          visualDensity: VisualDensity.compact,
                        ),

                        Chip(
                          label: Text(
                            item.funding,
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor:
                              Colors.green.withOpacity(.15),
                          visualDensity: VisualDensity.compact,
                        ),

                      ],
                    ),

                  ],
                ),
              ),

              IconButton(
                onPressed: () {

                  setState(() {

                    item.toggleFavorite();

                  });

                },

                icon: Icon(
                  item.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),

            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [

              const Icon(
                Icons.calendar_month,
                color: Colors.orange,
                size: 18,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  item.deadline,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 46,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(
                      scholarship: item,
                    ),
                  ),
                );

              },

              child: const Text(
                "View Detail",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}