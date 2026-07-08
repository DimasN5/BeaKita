import 'package:flutter/material.dart';

import '../../services/dummy_scholarship.dart';
import '../../utils/app_colors.dart';
import '../detail/detail_page.dart';
import '../home/widgets/bottom_navbar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Favorite Scholarship",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavbar(
        selectedIndex: 2,
      ),

      body: favoriteScholarships.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20),

                  Text(
                    "No Favorite Scholarship",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Tap the ❤️ icon to save scholarships.",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: favoriteScholarships.length,
              itemBuilder: (context, index) {
                final item = favoriteScholarships[index];

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
                    children: [

                      ListTile(

                        contentPadding: EdgeInsets.zero,

                        leading: CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              AppColors.primary.withOpacity(.15),
                          child: const Icon(
                            Icons.school,
                            color: AppColors.primary,
                          ),
                        ),

                        title: Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 5),

                            Text(item.organization),

                            const SizedBox(height: 5),

                            Text(
                              item.deadline,
                              style: const TextStyle(
                                color: Colors.orange,
                              ),
                            ),

                          ],
                        ),

                        trailing: IconButton(

                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),

                          onPressed: () {

                            setState(() {

                              item.toggleFavorite();

                            });

                          },

                        ),

                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
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
                            ),
                          ),

                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
    );
  }
}