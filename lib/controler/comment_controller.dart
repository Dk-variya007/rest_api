// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/comment_model.dart';

class CommentController extends GetxController {
  RxList list = [].obs;
  var isLoading = true.obs;

  static bool isLoaderShow = false;
  Rx<Error> error = Error().obs;

  void showLoader() async {
    isLoaderShow = true;
    await Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: true);
    isLoaderShow = false;
  }

  void dismissLoader() {
    // if (isLoaderShow) {
    //   Get.closeAllSnackbars();
    Get.back(closeOverlays: false, canPop: false);
  }

  void getData() async {
    try {
      showLoader();
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      dismissLoader();
      if (response.statusCode == 200) {
        List<CommentModel> loadComment = [];
        var data = jsonDecode(response.body);
        for (Map i in data) {
          loadComment.add(CommentModel.fromJson(i));
        }
        list.value = loadComment;
      } else {
        throw Exception("error");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
