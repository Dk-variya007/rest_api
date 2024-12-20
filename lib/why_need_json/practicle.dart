import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  List<Name> namelist=[
    Name(name: "Divyesh", age: 2),
    Name(name: "jigu", age:29)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
    itemCount: namelist.length,
      itemBuilder: (context, index) {
        return Card(
          child: Text(namelist[index].name.toString()),
        );
      },
    ));
  }
}
class Name  {
  String name;
  int age;
  Name({required this.name,required this.age});
}