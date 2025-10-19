import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/constant/app_local_image.dart';
import 'package:template/core/services/signInWithGoogle_Service.dart';
import 'package:template/screens/blog/view/blog_screen.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GoogleAuthService _authService = GoogleAuthService();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                loginImg,
                width: 150,
                height: 150,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Get Started\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'by creating a free account',
                      style: TextStyle(
                        fontSize: 16,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              OutlinedButton(
                onPressed: () async {
                  User? user = await _authService.signInWithGoogle();

                  if (user != null) {
                    Get.offAll(() => BlogScreen());
                  } else {
                    Get.snackbar("Error", "Google Sign-In failed");
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Color.fromARGB(
                          255, 255, 255, 255)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      google,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
