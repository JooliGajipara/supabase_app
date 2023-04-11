import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/Widgets/app_button.dart';
import 'package:supabase_app/Widgets/common_text_field.dart';
import 'package:supabase_app/controllers/authController.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'REGISTER',
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
                      textEditingController: _authController.nameController,
                      labelText: 'name',
                      validationMsg: 'Please enter your name',
                    ),
                    CommonTextField(
                      textEditingController: _authController.nameController,
                      labelText: 'Email',
                      onChanged: (value) => _authController.email.value = value,
                      validationMsg: 'Please enter your email',
                    ),
                    CommonTextField(
                      textEditingController: _authController.nameController,
                      labelText: 'Phone Number',
                      validationMsg: 'Please enter your phone number',
                      keyboardType: TextInputType.phone,
                    ),
                    CommonTextField(
                      textEditingController: _authController.addressController,
                      labelText: 'Phone Address',
                      validationMsg: 'Please enter your phone Address',
                    ),
                    CommonTextField(
                      labelText: 'Password',
                      onChanged: (value) =>
                          _authController.password.value = value,
                      validationMsg: 'Please enter your password',
                      isTextObscured: true,
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      if (_authController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SubmitButton(
                          size: MediaQuery.of(context).size,
                          title: 'Register',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _authController.register();
                            }
                          },
                        );
                      }
                    }),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Already have an account? Login'),
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
