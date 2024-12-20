// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WithOutModel extends StatefulWidget {
  const WithOutModel({super.key});

  @override
  State<WithOutModel> createState() => _WithOutModelState();
}

class _WithOutModelState extends State<WithOutModel> {
 late var data;

  Future<void> getUserApis() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Without model"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApis(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            reuseRow(
                                title: "name",
                                value: data[index]['name'].toString()),
                            reuseRow(title: "address", value: data[index]['address']['geo']['lat'].toString())
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

// ignore: camel_case_types
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
