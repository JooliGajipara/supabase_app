import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/view/Auth/login_screen.dart';
import 'package:supabase_app/view/home_screen.dart';

import '../controllers/authController.dart';

class Root extends StatelessWidget {
  Root({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authController.isAuthenticated.value) {
        return HomeScreen();
      } else {
        return LoginScreen();
      }
    });
  }
}
