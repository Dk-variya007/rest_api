import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;
class PostModelScreen extends StatefulWidget {
  const PostModelScreen({super.key});

  @override
  State<PostModelScreen> createState() => _PostModelScreenState();
}

class _PostModelScreenState extends State<PostModelScreen> {
  List<PostModel> postlist = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(PostModel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: postlist.length,
                  itemBuilder: (context, index) {
                    return Text(postlist[index].title.toString());
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
