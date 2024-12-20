// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/comment_model.dart';

class CommentController extends GetxController {
  RxList list = [].obs;
  var isLoading = true.obs;

  void getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
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
