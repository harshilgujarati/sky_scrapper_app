import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/controller/providers/weather_provider.dart';
import 'package:sky_scrapper_app/controller/providers/wethername_provider.dart';
import 'package:sky_scrapper_app/models/weather_model.dart';

class location_find_page extends StatefulWidget {
  const location_find_page({Key? key}) : super(key: key);

  @override
  State<location_find_page> createState() => _location_find_pageState();
}

class _location_find_pageState extends State<location_find_page> {
  late Future<WeatherModel?> getWeather;

  @override
  void initState() {
    super.initState();
    ;
    Provider.of<Weather_Provider>(context, listen: false).getCityName("surat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enter Your City",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.sunny),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder(
          future: Provider.of<Weather_Provider>(context).getWeather,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR => ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              WeatherModel? weatherdatas = snapshot.data;
              return (weatherdatas == null)
                  ? Center(
                      child: Text("No data......"),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ds.gif",
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: AnimSearchBar(
                                    width: 400,
                                    textController:
                                        Provider.of<WeatherProvider>(context)
                                            .citycontroller,
                                    onSuffixTap: () {
                                      Provider.of<WeatherProvider>(context)
                                          .citycontroller
                                          .clear();
                                    },
                                    onSubmitted: (val) {
                                      Provider.of<Weather_Provider>(context,
                                              listen: false)
                                          .getCityName(val);
                                    }),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                  size: 48,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${weatherdatas.name}",
                                  style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Icon(
                                  Icons.access_alarms,
                                  size: 48,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 280,
                                  width: 410,
                                  child: Image(
                                    image: AssetImage("assets/images/we.webp"),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${weatherdatas.text}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${weatherdatas.temp_c}*",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60,
                                  ),
                                )
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 220,
                                      width: 190,
                                      decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Fahrenheit",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                              "assets/images/image-removebg-preview.png",
                                            ),
                                            height: 120,
                                            width: 120,
                                          ),
                                          Text(
                                            "${weatherdatas.temp_f}*",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 220,
                                      width: 190,
                                      decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Cloud",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                              "assets/images/ww.webp",
                                            ),
                                            height: 120,
                                            width: 120,
                                          ),
                                          Text(
                                            "${weatherdatas.cloud}*",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 220,
                                      width: 190,
                                      decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Time",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Icon(
                                            Icons.watch_later_outlined,
                                            size: 120,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "${weatherdatas.localtime}*",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 220,
                                      width: 190,
                                      decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Last Update",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                              "assets/images/ww.webp",
                                            ),
                                            height: 120,
                                            width: 120,
                                          ),
                                          Text(
                                            "${weatherdatas.last_updated}*",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Container(
                                    height: 820,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.white38,
                                    ),
                                    width: 390,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${weatherdatas.name}. ${weatherdatas.region}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Sonday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Text(
                                                "48*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Monday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Text(
                                                "40*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Tuesday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Text(
                                                "43*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "wednesday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Text(
                                                "38*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "ThursDay",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Text(
                                                "41*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "\tFriday\t\t",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 110,
                                              ),
                                              Text(
                                                "37*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Saturday",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Text(
                                                "44*",
                                                style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 60,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                  "assets/images/ww.webp",
                                                ),
                                                width: 70,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ds.gif",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.yellow, size: 130),
              ),
            );
          }),
    );
  }
}
