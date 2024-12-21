import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/freezed_model/user_model.dart';

class FreezedController extends GetxController {
  RxList<UserModel> list = <UserModel>[].obs; // Properly typed RxList
  RxBool isLoading = true.obs;
  Rx<UserModel> userModel = Rx(UserModel());

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (Map<String, dynamic> i in jsonData) {
          list.add(UserModel.fromJson(i));
        }
        isLoading.value = false;
        print(list);
      } else {
        list.clear();
        isLoading.value = false;
      }
    } catch (e) {
      print("Error fetching data: $e");
      isLoading.value = false;
    }
  }
}
