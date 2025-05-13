import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  late String time;
  late String location;
  late String flag;
  late String url;

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getdata () async {
    Response response= await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
    Map res=jsonDecode(response.body);
    time=res['time'];
  }

}