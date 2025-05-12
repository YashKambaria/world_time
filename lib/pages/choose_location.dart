import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  int counter = 0;
  @override
  void initState() {
    super.initState();
    print("init build");
  }

  @override
  Widget build(BuildContext context) {
    print("build only");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location", style: TextStyle(color: Colors.white)),
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter+=1;
          });
        },
        child: Text("counter is $counter"),
      ),
    );
  }
}
