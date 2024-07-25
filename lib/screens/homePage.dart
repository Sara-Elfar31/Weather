import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/screens/search.dart';
import 'package:weather/weather_bloc/get_weather_cubits.dart';

import '../main.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherModel = BlocProvider.of<getWeatherCubit>(context).weatherModel;

    if (weatherModel == null) {
      print('weatherModel is null in homePage');
      return  Scaffold(
        backgroundColor: Colors.grey.shade400,
        body:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ooops There Was An Error  ',style: TextStyle(
                fontFamily: 'EduAUVICWANTHand-SemiBold',
                color: Colors.black54,
                fontSize: 20
              ),),
              Image.asset('img/error.png',width: 40,height: 30,)
            ],
          ),
        ),
      );
    }

    print('weatherModel is not null in homePage');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
              colors: [
                getThemeColor(weatherModel.condition),
                getThemeColor(weatherModel.condition)[300]!,
                getThemeColor(weatherModel.condition)[50]!,
              ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherModel.country,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'EduAUVICWANTHand-SemiBold'
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text('  ,  ' ,style: TextStyle(
                    fontSize: 20
                  ),),
                  Text(
                    weatherModel.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'EduAUVICWANTHand-SemiBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Date ',
                    style: TextStyle(
                      fontFamily: 'EduAUVICWANTHand-SemiBold',
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    weatherModel.date,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'EduAUVICWANTHand-SemiBold',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  weatherModel.icon,
                  width: 70,
                ),
                Column(
                  children: [
                    Text(
                      'AvgTemp    ${weatherModel.avgtemp.round()}',
                      style: const TextStyle(
                        fontFamily: 'EduAUVICWANTHand-SemiBold',
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      'MaxTemp   ${weatherModel.maxtemp.round()}',
                      style: const TextStyle(
                        fontFamily: 'EduAUVICWANTHand-SemiBold',
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      'MinTemp    ${weatherModel.mintemp.round()}',
                      style: const TextStyle(
                        fontFamily: 'EduAUVICWANTHand-SemiBold',
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                weatherModel.condition,
                style: const TextStyle(
                  fontFamily: 'EduAUVICWANTHand-SemiBold',
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}