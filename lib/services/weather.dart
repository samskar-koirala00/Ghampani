import 'package:Ghampani/services/location.dart';
import 'package:Ghampani/utilities/constants.dart';

import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCurrentLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url =
        '$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$kAPIKey';

    NetworkHelper wm = NetworkHelper(url: url);
    dynamic decodedWeatherData = await wm.getWeatherData();
    return decodedWeatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$kOpenWeatherMapURL?q=$cityName&units=metric&appid=$kAPIKey';

    NetworkHelper wm = NetworkHelper(url: url);
    dynamic decodedWeatherData = await wm.getWeatherData();
    return decodedWeatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
