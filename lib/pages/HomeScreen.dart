import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map worldTime = {};

  @override
  Widget build(BuildContext context) {
    worldTime = worldTime.isNotEmpty ? worldTime : ModalRoute.of(context).settings.arguments;
    String backgroundImage = worldTime['isDayTime'] ? 'day.png' : 'night.png';
    Color backgroundColor = worldTime['isDayTime'] ? Colors.indigo[700] : Colors.blue;

    print('HomeScreen$worldTime');
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$backgroundImage'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      //Assume navigation is big async operation to do the pop style
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       worldTime = {
                         'time' : result['time'],
                         'flag' : result['flag'],
                         'isDayTime' : result['isDayTime'],
                         'location' : result['location']
                       };
                     });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit location',
                      style: TextStyle(color: Colors.grey[300]),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${worldTime['location']}',
                      style: TextStyle(fontSize: 28, letterSpacing: 2, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${worldTime['time']}',
                  style: TextStyle(fontSize: 64, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
