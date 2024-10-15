import 'package:depi_movie_app/pages/auth/register_page.dart';
import 'package:depi_movie_app/services/auth/auth_service.dart';
import 'package:depi_movie_app/widgets/LRButton.dart';
import 'package:depi_movie_app/widgets/lockPage_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ));
        });
    final authService = AuthService();
    authService.login(context, emailController.text, passwordController.text);
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
                  "Welcome Back!",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                      child: Text(
                        "Forget Password ?",
                        style: TextStyle(color: Colors.grey.shade200),
                      ),
                    )
                  ],
                ),
                Lrbutton(
                  text: "Login",
                  onTap: () => login(context),
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
                        "Not a member ?",
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
                                  builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          "Register",
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
