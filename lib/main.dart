import 'package:flutter/material.dart';
import 'package:world_time/pages/HomeScreen.dart';
import 'package:world_time/pages/LoadingScreen.dart';
import 'package:world_time/pages/LocationScreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LoadingScreen(),
    '/home': (context) => HomeScreen(),
    '/location': (context) => LocationScreen()
  },
));

