import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // location url for api endpoint

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      // make the request
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      print(now);

      // set the time property
      time = DateFormat.jm().format(now);
      isDayTime = (now.hour > 5 && now.hour < 19) ? true : false;
    }
    catch(ex){
      print('Exception --> $ex');
      time = 'Could\'nt get time';
    }
  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');