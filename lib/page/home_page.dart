
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/current_weather.dart';
import 'package:flutter_weather_app/page/current_page.dart';
import 'package:flutter_weather_app/page/forcust_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("AwsomeWeather"),
        bottom: TabBar(
          tabs: [
            Tab(child: Text("Today")),
            Tab(child: Text("7 Days Forcust")),
            ],
        ),
        ),
        body: TabBarView(
          children: [
            CurrentPage(),
            ForcustPage()

          ],
        ),
      ),
    );
  }
}
