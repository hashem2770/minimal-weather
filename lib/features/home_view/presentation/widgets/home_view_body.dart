import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minimal_weather/features/home_view/presentation/manager/weather_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
       if(state is WeatherLoaded){
         return Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(state.weather.cityName??'N/V'),
             ],
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
