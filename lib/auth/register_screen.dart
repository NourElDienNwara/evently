import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_serves.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/widgets/default_elevated_botton.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Image.asset('assets/images/evently.png', height: 27),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                Text(
                  'Create your account',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                SizedBox(height: 24),

                DefaultTextFormField(
                  hintText: 'Enter Your Name',
                  prefixIcon: 'user',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                DefaultTextFormField(
                  hintText: 'Enter Your Email',
                  prefixIcon: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                DefaultTextFormField(
                  hintText: 'Enter Your Password',
                  prefixIcon: 'password',
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                DefaultTextFormField(
                  hintText: 'Confirm Your Password',
                  prefixIcon: 'password',
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                DefaultElevatedBotton(label: 'Register', onPressed: register),

                SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      FirebaseServes.register(
        userName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ).then((user) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      });
    }
  }
}
