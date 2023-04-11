import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  RxBool isAuthenticated = false.obs;
  RxBool isLoading = false.obs;
  final _client = Supabase.instance.client;
  final email = ''.obs;
  final password = ''.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() {
    isAuthenticated.value = storage.read('isAuthenticated') ?? false;
  }

  // login
  Future<void> login() async {
    isLoading.value = true;
    final response = await _client.auth.signInWithPassword(
      email: email.value.trim(),
      password: password.value.trim(),
    );
    if (response.user == null) {
      isLoading.value = false;
      Get.snackbar(
        'Login Error',
        'Something went wrong!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isLoading.value = false;
      Get.offAllNamed('/home');
      storage.write('isAuthenticated', true);
      isAuthenticated.value = true;
    }
  }

  // Register user
  Future<void> register() async {
    isLoading.value = true;
    final response = await _client.auth.signUp(
      email: email.value.trim(),
      password: password.value.trim(),
    );
    if (response.user == null) {
      Get.snackbar(
        'Registration Error',
        'Something went wrong!',
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
    } else {
      await _client.from('users').insert({
        'user_id': response.user!.id,
        'name': nameController.text,
        'email': response.user!.email,
        'phone_number': phoneNumberController.text,
        'address': addressController.text
      });
      isLoading.value = false;
      Get.offAllNamed('/login');
    }
  }

  // logout user
  logOutUser() async {
    await _client.auth.signOut();
    storage.write('isAuthenticated', false);
    isAuthenticated.value = false;
    Get.offAllNamed('/login');
  }
}
