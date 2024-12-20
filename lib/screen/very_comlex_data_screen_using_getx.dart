import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controler/very_complex_data_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class VeryComplexScreenGetx extends StatelessWidget {
  const VeryComplexScreenGetx({super.key});

  @override
  Widget build(BuildContext context) {
    final ComplexController controller = Get.put(ComplexController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Very Complex"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.complexData.value.data == null) {
          return const Center(
            child: Text("No data..."),
          );
        } else {
          return Column(
            children: [
              Text(controller.complexData.value.total.toString()),
              Text(controller.complexData.value.support?.url ?? ""),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.complexData.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final user = controller.complexData.value.data![index];
                    return ListTile(
                      title: Text(user.email ?? ""),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar ?? ""),
                      ),
                    );
                  },
                ),
              ),
              // Displaying the support URL and text
              GestureDetector(
                onTap: () async {
                  final url = controller.complexData.value.support?.url ?? "";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: ListTile(
                  title: Text(controller.complexData.value.support?.text ?? ""),
                  leading: const CircleAvatar(
                    child: Icon(Icons.info),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
