import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controler/withoutmodel_controller.dart';

class WithOutModelGetx extends StatefulWidget {
  const WithOutModelGetx({super.key});

  @override
  State<WithOutModelGetx> createState() => _WithOutModelGetxState();
}

class _WithOutModelGetxState extends State<WithOutModelGetx> {
  final WithOutModelController withOutModelController =
      Get.put(WithOutModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (withOutModelController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: withOutModelController.userList.length,
                  itemBuilder: (context, index) {
                    final user = withOutModelController.userList[index];
                    return Card(
                      child: Column(
                        children: [
                          ReuseRow(
                            title: "Name",
                            value: user['name'].toString(),
                          ),
                          ReuseRow(
                            title: "Address",
                            value: user['address']['geo']['lat'].toString(),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
class ReuseRow extends StatelessWidget {
  final String value, title;

  const ReuseRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}