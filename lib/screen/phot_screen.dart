import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api/Models/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PhotoScreen> {
  List<PhotoModel> photolist = [];

  Future<List<PhotoModel>> getPhoto() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photoModel = PhotoModel(title: i['title'], url: i['url']);//specific variable ne value deva
        photolist.add(photoModel);
        //photolist.add(PhotoModel.fromJson(i));//this is for whole model na variable ne

      }
      return photolist;
    } else {
      return photolist;
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
            future: getPhoto(),
            builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: photolist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      title: Text(snapshot.data![index].title.toString()),
                    );
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