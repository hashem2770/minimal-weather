import 'package:flutter/material.dart';
import 'package:minimal_weather/features/home_view/data/repos/weather_repo_impl.dart';
import 'package:minimal_weather/features/home_view/data/web_services/web_services.dart';
import 'package:minimal_weather/features/home_view/presentation/manager/weather_cubit.dart';

import '../widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherCubit(WeatherRepoImpl(WebService()))
          ..fetchWeatherByCoordinates(),
        child: const HomeViewBody(),
      ),
    );
  }
}
