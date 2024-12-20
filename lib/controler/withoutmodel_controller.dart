import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class WithOutModelController extends GetxController {
  var isLoading = true.obs;
  var userList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        userList.value = jsonDecode(response.body);
      } else {
        throw Exception("Failed to load users");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
