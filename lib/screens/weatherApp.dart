import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/screens/search.dart';
import 'package:weather/services/weatherService.dart';
import 'package:weather/weather_bloc/get_weather_cubits.dart';
import 'package:weather/weather_bloc/get_weather_states.dart';

import 'homePage.dart';

class weatherApp extends StatefulWidget {

   const weatherApp({super.key});

  @override
  State<weatherApp> createState() => _weatherAppState();
}

class _weatherAppState extends State<weatherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder <getWeatherCubit,getWeatherStates>
        (
        builder: (context, state) {
          if (state is initialState)
            {
              return const search() ;
            }
          else if (state is weatherLoadedState)
            {
              print(state.weatherModel);
              return homePage() ;
            }
          else
            {
              return const Text('Ooops There Was An Error');
            }
        },
      ),
    );
  }
}

