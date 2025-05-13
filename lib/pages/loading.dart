import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      // url: "America%2FLos_Angeles",
    );
    await instance.getdata();
    // by this we can transfer the data to the home route
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDay': instance.isDay,
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
      body: Container(
        child: SpinKitSpinningLines(
              color: Colors.white,
              size: 230.0,
            ),
      )
    );
  }
}
