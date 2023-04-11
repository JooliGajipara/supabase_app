import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:supabase_app/controllers/home_screen_controller.dart';

import '../Widgets/list_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('profile');
              },
              icon: const Icon(Icons.person))
        ],
      ),
      floatingActionButton: Hidable(
        controller: scrollController,
        child: Align(
          alignment: Alignment.centerRight,
          child: FloatingActionButton(
            onPressed: () {
              _homeScreenController.clearControllerData();
              Get.toNamed('addEmployeeScreen');
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Obx(() => _homeScreenController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    // padding: const EdgeInsets.only(
                    //     bottom: kFloatingActionButtonMargin + 48),
                    itemCount: _homeScreenController.employeeList.length,
                    itemBuilder: (context, index) => CommonListTile(
                      employeeModel: _homeScreenController.employeeList[index],
                      onPressedDelete: () {
                        _homeScreenController.deleteEmployee(
                            id: _homeScreenController.employeeList[index].id
                                .toString());
                      },
                      onPressedEdit: () {
                        _homeScreenController.setDataInEdit(
                            employeeModel:
                                _homeScreenController.employeeList[index],
                            empIndex: index);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
    );
  }
}
