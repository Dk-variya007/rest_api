import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/binding/binding.dart';
import 'package:rest_api/screen/complejson_user_model.dart';
import 'package:rest_api/login_screen/signup_screen.dart';
import 'package:rest_api/screen/comment_screen.dart';
import 'package:rest_api/screen/phot_screen.dart';
import 'package:rest_api/screen/user_data_freezed.dart';
import 'package:rest_api/screen/very_comlex_data_screen_using_getx.dart';
import 'package:rest_api/screen/very_complex_data_screen.dart';
import 'package:rest_api/screen/withOutModel.dart';
import 'package:rest_api/screen/without_model_getx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: FreezedBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CommentModelScreen());
  }
}
