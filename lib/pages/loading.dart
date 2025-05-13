import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
      location: "Upleta",
      flag: "Upleta.png",
      url: "Asia%2FKolkata",
    );
    await instance.getdata();
    //by this we can transfer the data to the home route
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text('loading', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
