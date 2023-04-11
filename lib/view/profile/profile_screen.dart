import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/Widgets/app_button.dart';
import 'package:supabase_app/controllers/profile_controller.dart';

import '../../controllers/authController.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Obx(() {
        return _profileController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Card(
                  elevation: 12,
                  margin: const EdgeInsets.all(16),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'MY PROFILE',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: IconButton(
                                onPressed: () {
                                  Get.toNamed('editProfileScreen');
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        commonRichText(
                            titleKey: 'Name',
                            title: _profileController.userModel.name ?? ''),
                        commonRichText(
                            titleKey: 'Email',
                            title: _profileController.userModel.email ?? ''),
                        commonRichText(
                            titleKey: 'Address',
                            title: _profileController.userModel.address ?? ''),
                        commonRichText(
                            titleKey: 'Phone Number',
                            title:
                                _profileController.userModel.phoneNumber ?? ''),
                        const Spacer(),
                        SubmitButton(
                          size: MediaQuery.of(context).size,
                          title: 'Logout',
                          onPressed: () {
                            _authController.logOutUser();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  Widget commonRichText({String? titleKey, String? title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: titleKey,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: ': ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: title),
          ],
        ),
      ),
    );
  }
}
