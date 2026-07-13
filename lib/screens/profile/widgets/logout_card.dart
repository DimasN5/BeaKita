import 'package:flutter/material.dart';

class LogoutCard extends StatelessWidget {
  final VoidCallback? onLogout;
  const LogoutCard({super.key, this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.red.withOpacity(.1), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.logout, color: Colors.red),
        ),
        title: const Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Logout"),
              content: const Text("Apakah Anda yakin ingin logout?"),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Batal")),
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    onLogout?.call();
                  },
                  child: const Text("Ya, Logout", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
