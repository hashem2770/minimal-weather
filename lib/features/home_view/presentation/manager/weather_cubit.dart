import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minimal_weather/features/home_view/data/repos/weather_repo_impl.dart';

import '../../data/models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepoImpl) : super(WeatherInitial());
  WeatherRepoImpl weatherRepoImpl;

  fetchWeatherByCoordinates() async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel =
          await weatherRepoImpl.fetchWeatherByCoordinates();
      emit(WeatherLoaded(weatherModel));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
