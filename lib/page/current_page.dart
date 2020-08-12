import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/provider/weather_provider.dart';
import 'package:provider/provider.dart';

class CurrentPage extends StatefulWidget {
  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<WeatherProvider>(
          builder: (context,provider,child)=>
          provider.currentData==null ? Center(child: CircularProgressIndicator()): Column(children: [Text("${provider.currentData.main.temp}")],)
    ),
    );
  }
}
