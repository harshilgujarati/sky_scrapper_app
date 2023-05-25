import 'package:flutter/foundation.dart';
import 'package:sky_scrapper_app/utils/helpers.dart';

import '../../models/weather_model.dart';

class Weather_Provider extends ChangeNotifier {

  late Future<WeatherModel?> getWeather;

  getCityName(val) {
    getWeather = APIHelper.apiHelper.fetchweather(val);
    notifyListeners();
  }
}