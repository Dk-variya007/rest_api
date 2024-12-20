import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/very_complex_data.dart';

class ComplexController extends GetxController {
  var isLoading = true.obs;
  var complexData = VeryComplexData().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    try {
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        complexData.value = VeryComplexData.fromJson(data);
      } else {
        throw Exception("error...");
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
