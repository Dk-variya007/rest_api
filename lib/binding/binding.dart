import 'package:get/get.dart';
import 'package:rest_api/controler/freezed_controller.dart';

class FreezedBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(FreezedController());
  }
}