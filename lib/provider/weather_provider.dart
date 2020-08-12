import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/model/current_weather.dart';
import 'package:flutter_weather_app/model/forcast_weather.dart';
import 'package:http/http.dart';

class WeatherProvider with ChangeNotifier{
  CurrentWeather _currentWeatherResponse;
  ForcastWeather _forecastWeatherResponse;

  CurrentWeather get currentData => _currentWeatherResponse;
  ForcastWeather get forecasetData => _forecastWeatherResponse;

  Future<void> getCurrentData()async{
    try{
      final url ='http://api.openweathermap.org/data/2.5/weather?lat=23.823313&lon=90.364427&appid=841392b99b2ad71133e2bfa8bd199e99';
      final response =await get(url);
      //print(response.body);
      final map=json.decode(response.body);
      _currentWeatherResponse=CurrentWeather.fromJson(map);
      notifyListeners();
    }
    catch(error){
      throw error;
    }

  }
}