import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String time;
  late String location;
  late String flag;
  late String url;

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getdata () async {
    try {
      Response response = await get(
          Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map res = jsonDecode(response.body);
      DateTime dt = DateTime.parse(res['dateTime'] as String);
      time=DateFormat.jm().format(dt);
    }
    catch(e){
      print('error is here $e');
      time="Unable to fetch time";
    }
  }

}