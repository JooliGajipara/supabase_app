import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/controllers/authController.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/common_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Card(
          elevation: 12,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LOGIN',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonTextField(
                      labelText: 'Email',
                      onChanged: (value) => _authController.email.value = value,
                      validationMsg: 'Please enter your email',
                    ),
                    CommonTextField(
                      labelText: 'Password',
                      onChanged: (value) =>
                          _authController.password.value = value,
                      validationMsg: 'Please enter your password',
                      isTextObscured: true,
                    ),
                    const SizedBox(height: 50),
                    Obx(() {
                      if (_authController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SubmitButton(
                          size: MediaQuery.of(context).size,
                          title: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _authController.login();
                            }
                          },
                        );
                      }
                    }),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      child: const Text('Create an account'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
