import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 25,
          ),

          child: Column(
            children: [

              const SizedBox(height: 40),

              // LOGO
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.primary,
                child: const Icon(
                  Icons.school,
                  size: 45,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Login to continue your scholarship journey",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 40),

              const CustomTextField(
                hint: "Email",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              const CustomTextField(
                hint: "Password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Don't have an account?",
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}