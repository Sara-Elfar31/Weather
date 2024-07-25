
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/homePage.dart';
import 'package:weather/services/weatherService.dart';
import 'package:weather/weather_bloc/get_weather_cubits.dart';

import '../models/weatherModel.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // title: const Text('Weather',style: TextStyle(
        //   color: Colors.brown,
        //   fontSize: 30,
        //   fontFamily: 'EduAUVICWANTHand-SemiBold'
        // ),),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/weather.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onSubmitted: (value) async {
                var getWeather = BlocProvider.of<getWeatherCubit>(context);
                await getWeather.getWeatherService(cityName: value);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const homePage();
                }));
              },
              decoration:  const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54,width: 4)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  hintText: 'Enter City',
                  hintStyle: TextStyle(fontSize: 18 ,color: Colors.black54),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
        ),
      ),
    );
  }
}