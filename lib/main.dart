import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/providers/wethername_provider.dart';
import 'package:sky_scrapper_app/views/screens/location_find_page.dart';
import 'package:sky_scrapper_app/views/screens/SplashScreen.dart';

import 'controller/providers/weather_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
      ),
      ChangeNotifierProvider(create: (context)=>Weather_Provider())
    ],
    child: MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        "location_find_page": (context) => location_find_page(),
      },
    ),
  ));
}
