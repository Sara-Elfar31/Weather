import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/screens/homePage.dart';
import 'package:weather/screens/weatherApp.dart';
import 'package:weather/weather_bloc/get_weather_cubits.dart';
import 'package:weather/weather_bloc/get_weather_states.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => getWeatherCubit(),
    child: const customMaterialApp(),
  ));
}

class customMaterialApp extends StatelessWidget {
  const customMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <getWeatherCubit,getWeatherStates>(
      builder:(context, state) => MaterialApp(
        theme: ThemeData(
           primarySwatch: getThemeColor(BlocProvider.of<getWeatherCubit>(context).weatherModel?.condition)
        ),
        debugShowCheckedModeBanner: false,
        home: const weatherApp(),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if(condition == null)
    {
      return Colors.blueGrey ;
    }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
      return Colors.lightBlue;
    case 'Patchy snow possible':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.grey;
    case 'Blizzard':
      return Colors.grey;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
      return Colors.lightBlue;
    case 'Freezing drizzle':
      return Colors.cyan;
    case 'Heavy freezing drizzle':
      return Colors.cyan;
    case 'Patchy light rain':
      return Colors.blue;
    case 'Light rain':
      return Colors.blueGrey;
    case 'Moderate rain at times':
      return Colors.indigo;
    case 'Moderate rain':
      return Colors.blueGrey;
    case 'Heavy rain at times':
      return Colors.blue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
      return Colors.cyan;
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;
    case 'Light sleet':
      return Colors.blue;
    case 'Moderate or heavy sleet':
      return Colors.blue;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.lightBlue;
    case 'Patchy moderate snow':
      return Colors.lightBlue;
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Patchy heavy snow':
      return Colors.lightBlue;
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.cyan;
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
      return Colors.blue;
    case 'Moderate or heavy sleet showers':
      return Colors.blue;
    case 'Light snow showers':
      return Colors.lightBlue;
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'Light showers of ice pellets':
      return Colors.cyan;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'Patchy light rain with thunder':
      return Colors.blue;
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}