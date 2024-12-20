import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/Models/very_complex_data.dart';
import 'package:url_launcher/url_launcher.dart';

class VeryComplexScreen extends StatelessWidget {
  const VeryComplexScreen({super.key});

  Future<VeryComplexData> getData() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return VeryComplexData.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Very Complex"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("No data..."),
            );
          } else {
            return Column(
              children: [
                Text(snapshot.data!.total.toString()),
                Text(snapshot.data!.support!.url.toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) => ListTile(
                        title:
                            Text(snapshot.data!.data![index].email.toString()),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!.data![index].avatar.toString()),
                        )),
                  ),
                ),
                // Displaying the support URL and text
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(
                        snapshot.data!.support!.url.toString())) {
                      await launch(snapshot.data!.support!.url.toString());
                    } else {
                      throw 'Could not launch ${snapshot.data!.support!.url}';
                    }
                  },
                  child: ListTile(
                    title: Text(snapshot.data!.support!.text.toString()),
                    leading: const CircleAvatar(
                      // You can use a placeholder image or icon here
                      child: Icon(Icons.info),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
