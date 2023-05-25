import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<WeatherModel?> fetchweather(val) async {
    String location = val;
    String baseurl = "https://api.weatherapi.com/v1/current.json?key=7733634b64c5416ebea44350232305&q=$location";
    http.Response res = await http.get(Uri.parse(baseurl));
    if (res.statusCode == 200) {
      String data = res.body;
      Map<String, dynamic> decoddata = jsonDecode(data);
      WeatherModel weatherdata = WeatherModel.frommap(data: decoddata);
      return weatherdata;
    }
  }
}
