import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controler/comment_controller.dart';

class CommentModelScreen extends StatelessWidget {
  const CommentModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.put(CommentController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Course"),
      ),
      body: Obx(() {
        if (commentController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: commentController.list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(commentController.list[index].email ?? ''),
              );
            },
          );
        }
      }),
    );
  }
}
