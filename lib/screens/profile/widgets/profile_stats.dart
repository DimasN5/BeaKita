import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final String name;
  final String email;
  const ProfileStats({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        statItem("Email", email),
      ],
    );
  }

  Widget statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
