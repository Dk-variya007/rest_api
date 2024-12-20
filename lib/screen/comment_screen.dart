import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest_api/Models/comment_model.dart';
import 'package:rest_api/Models/photo_model.dart';
import 'package:rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;

class CommentModelScreen extends StatefulWidget {
  const CommentModelScreen({super.key});

  @override
  State<CommentModelScreen> createState() => _CommentModelScreenState();
}

class _CommentModelScreenState extends State<CommentModelScreen> {
  List<CommentModel> commentList = [];

  Future<List<CommentModel>> getComment() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        commentList.add(CommentModel.fromJson(i));
      }
      return commentList;
    } else {
      return commentList;
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
                  future: getComment(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(commentList[index].name.toString()),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
