import 'package:dio/dio.dart';
import 'package:minimal_weather/core/constant/constant.dart';
import 'package:minimal_weather/features/home_view/data/models/weather_model.dart';

class WebService {
  late Dio _dio;

  WebService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );
  }

  fetchWeatherByCoordinates(double lat, double lon) async{
    String url='${baseUrl}lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    Response result =await _dio.get(url);
    return WeatherModel.fromJson(result.data);
  }
}
