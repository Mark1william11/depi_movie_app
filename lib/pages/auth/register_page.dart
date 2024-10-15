import 'package:depi_movie_app/pages/auth/login_page.dart';
import 'package:depi_movie_app/services/auth/auth_service.dart';
import 'package:depi_movie_app/widgets/LRButton.dart';
import 'package:depi_movie_app/widgets/lockPage_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          );
        });
    final authService = AuthService();
    authService.register(context, emailController.text, passwordController.text,
        confirmPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.assignment_ind_outlined,
                  color: Colors.blueAccent,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                LockpageTextfield(
                  text: "Email",
                  obsecureTxt: false,
                  controller: emailController,
                ),
                LockpageTextfield(
                  text: "Password",
                  obsecureTxt: true,
                  controller: passwordController,
                ),
                LockpageTextfield(
                  text: "Confirm Password",
                  obsecureTxt: true,
                  controller: confirmPasswordController,
                ),
                Lrbutton(
                  text: "Register",
                  onTap: () => register(context),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already a member ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
