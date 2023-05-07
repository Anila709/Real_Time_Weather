/**
 {
  "coord": {
    "lon": 10.99,
    "lat": 44.34
  },
  "weather": [
    {
      
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  
  "main": {
    "temp": 298.48,

    "humidity": 64,
    
  },
  
  "wind": {
    "speed": 0.62,
  },
  
  "name": "Zocca",
}                        
 */

class WindspeedInfo {
  final double windspeed;

  WindspeedInfo({required this.windspeed});
  factory WindspeedInfo.fromJson(Map<String, dynamic> json) {
    final windspeed = json['speed'];
    return WindspeedInfo(windspeed: windspeed);
  }
}

class HumidityInfo {
  final int humidity;

  HumidityInfo({required this.humidity});
  factory HumidityInfo.fromJson(Map<String, dynamic> json) {
    final humidity = json['humidity'];
    return HumidityInfo(humidity: humidity);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final HumidityInfo humidityInfo;
  final WindspeedInfo windspeedInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherInfo,
      required this.humidityInfo,
      required this.windspeedInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);
    final humidityInfoJson = json['main'];
    final humidityInfo = HumidityInfo.fromJson(humidityInfoJson);
    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    final windspeedInfoJson = json['wind'];
    final windspeedInfo = WindspeedInfo.fromJson(windspeedInfoJson);
    return WeatherResponse(
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        humidityInfo: humidityInfo,
        windspeedInfo: windspeedInfo);
  }
}
