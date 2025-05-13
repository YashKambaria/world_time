import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe%2FLondon', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe%2FBerlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa%2FCairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa%2FNairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America%2FChicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America%2FNew_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia%2FSeoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia%2FJakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(location: "Upleta", flag: "india.png", url: "Asia%2FKolkata"),
  ];

  @override
  Widget build(BuildContext context) {
    print("build only");
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){

                },
                title: Text(locations[index].location,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                ),
              ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
