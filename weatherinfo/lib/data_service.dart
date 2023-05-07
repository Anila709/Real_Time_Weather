import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherinfo/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '6b7266affddfb1a4a15a952c15c2c92e',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
