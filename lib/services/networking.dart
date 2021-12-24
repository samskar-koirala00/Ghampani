import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String? url;

  NetworkHelper({this.url});

  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url!));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error status code: ${response.statusCode}');
    }
  }
}
