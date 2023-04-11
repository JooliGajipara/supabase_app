import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  final _client = Supabase.instance.client;
  UserModel userModel = UserModel();
  RxBool isLoading = false.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  // fetch user data
  Future<void> fetchUserData() async {
    isLoading.value = true;
    try {
      var user = _client.auth.currentUser;
      final data = await _client.from('users').select().eq('user_id', user?.id);
      if (data != null) {
        userModel = UserModel.fromJson(data[0]);
        if (kDebugMode) {
          print(userModel);
        }
        isLoading.value = false;
        setDataInEdit();
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Fetch Profile',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  setDataInEdit() {
    nameController.text = userModel.name ?? '';
    emailController.text = userModel.email ?? '';
    addressController.text = userModel.address ?? '';
    phoneNumberController.text = userModel.phoneNumber ?? '';
  }

  // update user data
  Future<void> updateData() async {
    isLoading.value = true;
    try {
      var user = _client.auth.currentUser;
      await _client.from('users').update({
        'name': nameController.text,
        'email': emailController.text,
        'phone_number': phoneNumberController.text,
        'address': addressController.text
      }).eq('user_id', user?.id);
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Successfully',
        'Profile Is Successfully Updated',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Update Profile',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
