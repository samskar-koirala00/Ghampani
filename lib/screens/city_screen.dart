import 'package:Ghampani/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  TextEditingController textFieldController = TextEditingController();

  String? userEnteredCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/city_background.jpg',
            ),
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
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: textFieldController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (textFieldController.text.isEmpty) {
                    Alert(
                            context: context,
                            title: "EMPTY TEXTFIELD",
                            desc:
                                "TextField cannot be empty. Please enter a city name.")
                        .show();
                  } else {
                    Navigator.pop(context, textFieldController.text);
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
