

import 'dart:convert';

ForcastWeather forcastWeatherFromJson(String str) => ForcastWeather.fromJson(json.decode(str));

String forcastWeatherToJson(ForcastWeather data) => json.encode(data.toJson());

class ForcastWeather {
  ForcastWeather({
    this.cod,
    this.message,
    this.city,
    this.cnt,
    this.list,
  });

  String cod;
  int message;
  City city;
  int cnt;
  List<ListElement> list;

  factory ForcastWeather.fromJson(Map<String, dynamic> json) => ForcastWeather(
    cod: json["cod"],
    message: json["message"],
    city: City.fromJson(json["city"]),
    cnt: json["cnt"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cod": cod,
    "message": message,
    "city": city.toJson(),
    "cnt": cnt,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.geonameId,
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.iso2,
    this.type,
    this.population,
  });

  int geonameId;
  String name;
  double lat;
  double lon;
  String country;
  String iso2;
  String type;
  int population;

  factory City.fromJson(Map<String, dynamic> json) => City(
    geonameId: json["geoname_id"],
    name: json["name"],
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    country: json["country"],
    iso2: json["iso2"],
    type: json["type"],
    population: json["population"],
  );

  Map<String, dynamic> toJson() => {
    "geoname_id": geonameId,
    "name": name,
    "lat": lat,
    "lon": lon,
    "country": country,
    "iso2": iso2,
    "type": type,
    "population": population,
  };
}

class ListElement {
  ListElement({
    this.dt,
    this.temp,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.clouds,
    this.rain,
    this.snow,
  });

  int dt;
  Temp temp;
  double pressure;
  int humidity;
  List<Weather> weather;
  double speed;
  int deg;
  int clouds;
  double rain;
  double snow;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    dt: json["dt"],
    temp: Temp.fromJson(json["temp"]),
    pressure: json["pressure"].toDouble(),
    humidity: json["humidity"],
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    speed: json["speed"].toDouble(),
    deg: json["deg"],
    clouds: json["clouds"],
    rain: json["rain"] == null ? null : json["rain"].toDouble(),
    snow: json["snow"] == null ? null : json["snow"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "temp": temp.toJson(),
    "pressure": pressure,
    "humidity": humidity,
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "speed": speed,
    "deg": deg,
    "clouds": clouds,
    "rain": rain == null ? null : rain,
    "snow": snow == null ? null : snow,
  };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    day: json["day"].toDouble(),
    min: json["min"].toDouble(),
    max: json["max"].toDouble(),
    night: json["night"].toDouble(),
    eve: json["eve"].toDouble(),
    morn: json["morn"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int id;
  Main main;
  Description description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: mainValues.map[json["main"]],
    description: descriptionValues.map[json["description"]],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": mainValues.reverse[main],
    "description": descriptionValues.reverse[description],
    "icon": icon,
  };
}

enum Description { SKY_IS_CLEAR, LIGHT_RAIN, MODERATE_RAIN }

final descriptionValues = EnumValues({
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "sky is clear": Description.SKY_IS_CLEAR
});

enum Main { CLEAR, RAIN }

final mainValues = EnumValues({
  "Clear": Main.CLEAR,
  "Rain": Main.RAIN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
