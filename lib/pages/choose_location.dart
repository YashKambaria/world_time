import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  void getdata () async {

    //this will be triggered in future after 3 seconds
    String username = await Future.delayed(Duration(seconds: 3),(){
      return "Yash";
    });

    //this will be triggered in future after 2 seconds
    String description = await Future.delayed(Duration(seconds:2),(){
      return "I am a App developer";
    });

    //now the problem is the name should be printed first and the description afterwards
    //to solve this we will use async and await
    print('$username - $description');
  }

  
  int counter = 0;
  @override
  void initState() {
    super.initState();
    print("init build");
    getdata();
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
