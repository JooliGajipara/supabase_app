import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/Widgets/app_button.dart';
import 'package:supabase_app/Widgets/common_text_field.dart';
import 'package:supabase_app/controllers/home_screen_controller.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen({Key? key}) : super(key: key);
  final HomeScreenController _homeScreenController =
      Get.find<HomeScreenController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_homeScreenController.isEdit.value
            ? 'Edit Employee'
            : 'Add Employee'),
      ),
      body: Center(
        child: Card(
          elevation: 12,
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _homeScreenController.isEdit.value
                        ? 'EDIT EMPLOYEE'
                        : 'ADD EMPLOYEE',
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextField(
                            textEditingController:
                                _homeScreenController.empNameController,
                            labelText: 'name',
                            validationMsg: 'Please enter employee name',
                          ),
                          CommonTextField(
                            textEditingController:
                                _homeScreenController.empEmailController,
                            labelText: 'Email',
                            validationMsg: 'Please enter employee email',
                          ),
                          CommonTextField(
                            textEditingController:
                                _homeScreenController.empAddressController,
                            labelText: 'Address',
                            validationMsg: 'Please enter employee address',
                          ),
                          CommonTextField(
                            keyboardType: TextInputType.phone,
                            textEditingController:
                                _homeScreenController.empPhoneNumberController,
                            labelText: 'Phone Number',
                            validationMsg: 'Please enter employee phone number',
                          ),
                          CommonTextField(
                            keyboardType: TextInputType.number,
                            textEditingController:
                                _homeScreenController.empSalaryController,
                            labelText: 'Salary',
                            validationMsg: 'Please enter employee salary',
                          ),
                          const SizedBox(height: 30),
                          Obx(() {
                            return _homeScreenController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SubmitButton(
                                    size: MediaQuery.of(context).size,
                                    title: 'SAVE',
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (!_homeScreenController
                                            .isEdit.value) {
                                          _homeScreenController
                                              .addEmployeeData();
                                        } else {
                                          _homeScreenController.updateData();
                                        }
                                      }
                                    },
                                  );
                          }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
