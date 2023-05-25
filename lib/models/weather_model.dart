class WeatherModel {
  String name;
  String region;
  String country;
  String localtime;
  String last_updated;
  double wind_mph;
  int cloud;
  double temp_c;
  double temp_f;
  String text;

  WeatherModel({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
    required this.last_updated,
    required this.wind_mph,
    required this.cloud,
    required this.temp_c,
    required this.temp_f,
    required this.text
  });

  factory WeatherModel.frommap({required Map data}) {
    return WeatherModel(
      name: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      localtime: data['location']['localtime'],
      last_updated: data['current']['last_updated'],
      wind_mph: data['current']['wind_mph'],
      cloud: data['current']['cloud'],
      temp_c: data['current']['temp_c'],
      temp_f: data['current']['temp_f'],
      text: data['current']['condition']['text'],
    );
  }
}
