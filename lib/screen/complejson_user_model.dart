import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api/Models/user_model.dart';
import 'package:http/http.dart' as http;

//building list with complex json data with model flutter
class ComplexModel extends StatefulWidget {
  const ComplexModel({super.key});

  @override
  State<ComplexModel> createState() => _ComplexModelState();
}

class _ComplexModelState extends State<ComplexModel> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex Model"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUser(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                    ),
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            reuseRow(
                                title: "Name",
                                value: userList[index].name.toString()),
                            reuseRow(
                                title: "email",
                                value: userList[index].email.toString()),
                            reuseRow(
                                title: "address",
                                value:
                                    userList[index].address!.city.toString()+userList[index]
                                        .address!
                                        .geo!
                                        .lat
                                        .toString()),
                            reuseRow(
                                title: "geo",
                                value: userList[index]
                                    .address!
                                    .geo!
                                    .lat
                                    .toString())
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class reuseRow extends StatelessWidget {
  String value, title;

  reuseRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
  }
}
