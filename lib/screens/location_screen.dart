import 'package:Ghampani/services/weather.dart';
import 'package:Ghampani/utilities/constants.dart';

import 'package:flutter/material.dart';
import 'city_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;

  LocationScreen({this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  String? cityName;
  String? condition;
  String? message;
  int? temp;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = '';
        temp = 0;
        message = 'Unable to get the weather data';
        condition = 'Error';
        Alert(
                context: context,
                title: "DATA ERROR",
                desc: "Unable to get the weather data.")
            .show();
        return;
      }
      cityName = weatherData['name'];
      int conditionID = weatherData['weather'][0]['id'];
      dynamic weatherTemp =
          weatherData['main']['temp']; // Can be double or int.
      temp = weatherTemp.toInt();
      message = weatherModel.getMessage(temp!);
      condition = weatherModel.getWeatherIcon(conditionID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      dynamic decodedWeatherData =
                          await weatherModel.getCurrentLocationWeather();
                      updateUI(decodedWeatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String? userEnteredCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      if (userEnteredCityName != null) {
                        dynamic decodedWeatherData = await weatherModel
                            .getCityWeather(userEnteredCityName);
                        updateUI(decodedWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '${temp!}°C',
                    style: kTempTextStyle,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '$condition',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Text(
                '$message in $cityName.',
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
