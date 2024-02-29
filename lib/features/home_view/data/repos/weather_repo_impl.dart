import 'package:minimal_weather/features/home_view/data/models/weather_model.dart';
import 'package:minimal_weather/features/home_view/data/web_services/web_services.dart';
import 'package:geolocator/geolocator.dart';

class WeatherRepoImpl{
  WebService webService;

  WeatherRepoImpl(this.webService);
  Future<Position?> getLocation() async {
    // Request location permission.
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      // Permission granted
      try {
        // Get the current location with high accuracy.
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10), // Set a timeout for requesting location.
        );
        return position;
      } catch (e) {
        // Handle other exceptions.
        print("Error getting location: $e");
        return null;
      }
    } else {
      // Permission denied or permanently denied
      print("Location permission denied");
      return null;
    }
  }

  Future<WeatherModel> fetchWeatherByCoordinates()async{
    Position? position = await getLocation();
    return webService.fetchWeatherByCoordinates(position!.latitude, position.longitude);
  }
}