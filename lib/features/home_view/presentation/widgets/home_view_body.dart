import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weather/features/home_view/presentation/manager/weather_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

   String displaySamples(String? condition){
     if( condition == null|| condition.isEmpty) return 'assets/samples/sunny.json';
     switch(condition.toLowerCase()){
       case 'clouds':
       case 'mist':
       case 'smoke':
       case 'haze':
       case 'dust':
       case 'fog':
         return 'assets/samples/cloudy.json';
       case 'rain':
       case 'drizzle':
       case 'shower rain':
         return 'assets/samples/rainy.json';
       case 'clear':
         return 'assets/samples/sunny.json';
       case 'thunderstorm':
         return 'assets/samples/thunder.json';
       default:
         return 'assets/samples/sunny.json';
     }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
       if(state is WeatherLoaded){
         return SafeArea(
           child: Container(
             alignment: Alignment.center,
             padding: const EdgeInsets.symmetric(vertical: 64),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(state.weather.cityName??'N/V'),
                 Text(state.weather.temp.toString()),
                 Lottie.asset(displaySamples(state.weather.condition)),
                 Text(state.weather.condition.toString()),
               ],
             ),
           ),
         );
       }else if(state is WeatherFailure){
         return Center(
           child: Text(state.message),
         );
       }else{
         return const Center(
           child: CircularProgressIndicator(),
         );
       }
      },
    );
  }
}
