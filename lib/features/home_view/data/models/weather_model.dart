class WeatherModel {
  num? lat;
  num? lon;
  String? condition;
  num? temp;
  String? cityName;

  WeatherModel({
    required this.lat,
    required this.lon,
    required this.condition,
    required this.temp,
    required this.cityName,
  });

   factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
      condition: json['weather'][0]['main'],
      temp: json['main']['temp'],
      cityName: json['name'],
    );
  }
}
