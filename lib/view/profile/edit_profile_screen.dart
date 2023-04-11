import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/Widgets/common_text_field.dart';

import '../../Widgets/app_button.dart';
import '../../controllers/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.find<ProfileController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Card(
          elevation: 12,
          margin: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'EDIT PROFILE',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CommonTextField(
                      textEditingController: _profileController.nameController,
                      labelText: 'name',
                      validationMsg: 'Please enter your name',
                    ),
                    CommonTextField(
                      textEditingController: _profileController.emailController,
                      labelText: 'Email',
                      validationMsg: 'Please enter your email',
                    ),
                    CommonTextField(
                      keyboardType: TextInputType.phone,
                      textEditingController:
                          _profileController.phoneNumberController,
                      labelText: 'Phone Number',
                      validationMsg: 'Please enter your phone number',
                    ),
                    CommonTextField(
                      textEditingController:
                          _profileController.addressController,
                      labelText: 'Address',
                      validationMsg: 'Please enter your phone Address',
                    ),
                    const SizedBox(height: 30),
                    SubmitButton(
                      size: MediaQuery.of(context).size,
                      title: 'SAVE',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _profileController.updateData();
                        }
                      },
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
