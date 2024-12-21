import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controler/freezed_controller.dart';

class UserDataFreezed extends GetView<FreezedController> {
  const UserDataFreezed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                var user=  controller.userModel.value = controller.list[index];
                  return ListTile(
                    title: Text(user.email),
                  );
                },
              ),
      ),
    );
  }
}
