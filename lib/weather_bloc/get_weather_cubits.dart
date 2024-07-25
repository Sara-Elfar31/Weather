import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weatherModel.dart';
import 'package:weather/weather_bloc/get_weather_states.dart';

import '../services/weatherService.dart';

class getWeatherCubit extends Cubit<getWeatherStates> {
  getWeatherCubit() : super(initialState());
  WeatherModel? weatherModel;

  Future<void> getWeatherService({required String cityName}) async {
    try {
      final response = await weatherService(Dio()).getCurrentWeather(cityName: cityName);
      if (response != null) {
        weatherModel = response;
        emit(weatherLoadedState(weatherModel!));
        print('Weather data loaded: $weatherModel');
      } else {
        emit(weatherFailureState());
        print('Weather data is null');
      }
    } catch (e) {
      emit(weatherFailureState());
      print('Error occurred: $e');
    }
  }
}