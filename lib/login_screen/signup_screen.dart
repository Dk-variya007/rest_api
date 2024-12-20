import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login(String email, String pass) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/register"), body: {
        'email': email,
        'password': pass,
      });
      if (response.statusCode == 200) {
        var data=jsonDecode(response.body.toString());
        print(data);
        print(data['id']);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("account created successfully"),
          duration: Duration(seconds: 3),
        ));
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(label: Text("Email")),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(label: Text("Password")),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  login(_emailController.text, _passwordController.text);
                },
                child: const Text("signup"))
          ],
        ),
      ),
    );
  }
}
