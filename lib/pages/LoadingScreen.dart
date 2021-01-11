import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/services/WorldTimeUtils.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    print(worldTime);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitFoldingCube(
      color: Colors.blue[900],
      size: 64.0,
      duration: Duration(seconds: 4),
    )));
  }
}
