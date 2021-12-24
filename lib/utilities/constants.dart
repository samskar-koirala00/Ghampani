import 'package:flutter/material.dart';

const kAPIKey = '6ca052496ffef901af35a2cf1e404f60';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
// url https://api.openweathermap.org/data/2.5/weather?q=kathmandu&appid=6ca052496ffef901af35a2cf1e404f60

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.w900,
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.w900,
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'Spartan MB',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldStyle = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  fillColor: Colors.white,
  filled: true,
  hintText: 'Enter City Name.',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
