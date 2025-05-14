import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {
    'time': 'Unknown',
    'location': 'Unknown',
    'flag': '',
    'isDay': true,
  };

  @override
  Widget build(BuildContext context) {
    //now the data will be rebuild here so we will keep ternary operator here
    if(data['time']=="Unknown"){
      data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    } else{
      data=data;
    }


    String pathOfBg = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor=data['isDay']?Colors.blue:Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$pathOfBg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    dynamic result=await Navigator.pushNamed(context, '/location');
                    //after getting this task done we will update it by setState
                    setState(() {
                      data['time']=result['time'];
                      data['location']=result['location'];
                      data['flag']=result['flag'];
                      data['isDay']=result['isDay'];
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit location"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 70, color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
