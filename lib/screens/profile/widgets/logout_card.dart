import 'package:flutter/material.dart';
import '../../auth/login_page.dart'; // Pastikan path import ke login_page.dart sudah benar

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        // Menampilkan dialog konfirmasi keluar akun yang bersih dan rapi
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                "Keluar Akun",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text("Apakah kamu yakin ingin keluar dari aplikasi BeaKita?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context), // Menutup dialog jika batal
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // 1. Tutup dialog konfirmasi terlebih dahulu
                    Navigator.pop(context); 
                    
                    // [BACKEND READY] Tempat menaruh logika hapus token/session nanti:
                    // SharedPreferences pref = await SharedPreferences.getInstance();
                    // pref.clear();

                    // 2. Bersihkan seluruh history page dan arahkan kembali ke LoginPage
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false, // Menghapus semua route sebelumnya agar tidak bisa di-back
                    );
                  },
                  child: const Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffFFF5F5),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xffFFD8D8),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xffFFE5E5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 15),
            const Expanded(
              child: Text(
                "Keluar Akun",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded, // Disamakan dengan gaya chevron menu profil
              color: Colors.red,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}