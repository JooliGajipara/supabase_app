import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_app/model/EmployeeModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreenController extends GetxController {
  final _client = Supabase.instance.client;
  RxBool isLoading = false.obs;
  RxBool isEdit = false.obs;
  RxInt empId = 0.obs;
  RxInt empSelectedIndex = 0.obs;
  final TextEditingController empNameController = TextEditingController();
  final TextEditingController empEmailController = TextEditingController();
  final TextEditingController empAddressController = TextEditingController();
  final TextEditingController empPhoneNumberController =
      TextEditingController();
  final TextEditingController empSalaryController = TextEditingController();
  EmployeeModel employeeModel = EmployeeModel();
  RxList<EmployeeModel> employeeList = <EmployeeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserEmployeeData();
  }

  //get employee data
  Future<void> fetchUserEmployeeData() async {
    isLoading.value = true;
    try {
      var user = _client.auth.currentUser;
      final data =
          await _client.from('data_table').select().eq('user_id', user?.id);
      if (data != null) {
        employeeList.clear();
        for (var i = 0; i < data.length; i++) {
          employeeModel = EmployeeModel.fromJson(data[i]);
          employeeList.add(employeeModel);
        }
        if (kDebugMode) {
          print('Employee Length:----${employeeList.length}');
        }
        isLoading.value = false;
      }
      update();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Fetch Employee',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // add employee data
  Future<void> addEmployeeData() async {
    try {
      isLoading.value = true;
      var user = _client.auth.currentUser;
      final data = await _client.from('data_table').insert({
        'user_id': user!.id,
        'employee': {
          'emp_name': empNameController.text,
          'emp_email': empEmailController.text,
          'emp_address': empAddressController.text,
          'emp_salary': empSalaryController.text,
          'emp_mobile': empPhoneNumberController.text,
          'emp_id': DateTime.now().millisecondsSinceEpoch,
        }
      }).select();
      if (data != null) {
        if (kDebugMode) {
          print(data);
        }
        isLoading.value = false;
        Get.back();
        fetchUserEmployeeData();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Add Employee',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Delete employee data
  deleteEmployee({String? id}) async {
    try {
      final data =
          await _client.from('data_table').delete().match({'id': id}).select();
      if (data != null) {
        fetchUserEmployeeData();
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Delete Employee',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  setDataInEdit({required EmployeeModel employeeModel, required int empIndex}) {
    Get.toNamed('addEmployeeScreen');
    isEdit.value = true;
    empSelectedIndex.value = empIndex;
    empId.value = employeeModel.id!.toInt();
    empNameController.text = employeeModel.employee?.empName ?? '';
    empEmailController.text = employeeModel.employee?.empEmail ?? '';
    empAddressController.text = employeeModel.employee?.empAddress ?? '';
    empSalaryController.text = employeeModel.employee?.empSalary ?? '';
    empPhoneNumberController.text = employeeModel.employee?.empMobile ?? '';
    update();
  }

  // update employee data
  Future<void> updateData() async {
    isLoading.value = true;
    try {
      var user = _client.auth.currentUser;
      final data = await _client
          .from('data_table')
          .update({
            'user_id': user!.id,
            'employee': {
              'emp_name': empNameController.text,
              'emp_email': empEmailController.text,
              'emp_address': empAddressController.text,
              'emp_salary': empSalaryController.text,
              'emp_mobile': empPhoneNumberController.text,
              'emp_id': empId.value,
            }
          })
          .eq('id', empId.value)
          .select();
      if (data != null) {
        employeeList[empSelectedIndex.value] = EmployeeModel.fromJson(data[0]);
      }
      isLoading.value = false;
      Get.back();
      Get.snackbar(
        'Successfully',
        'Employee Is Successfully Updated',
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

  // clear data
  clearControllerData() {
    isEdit.value = false;
    empId.value = 0;
    empNameController.clear();
    empEmailController.clear();
    empAddressController.clear();
    empSalaryController.clear();
    empPhoneNumberController.clear();
    update();
  }
}
