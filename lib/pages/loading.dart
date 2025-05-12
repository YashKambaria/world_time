import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getdata () async {
      Response response= await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      Map res=jsonDecode(response.body);
      print(res['title']);
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("This is loading screen"),
    );
  }
}
