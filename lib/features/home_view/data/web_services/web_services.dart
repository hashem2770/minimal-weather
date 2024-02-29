import 'package:dio/dio.dart';
import 'package:minimal_weather/core/constant/constant.dart';

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
    return result.data;
  }
}
