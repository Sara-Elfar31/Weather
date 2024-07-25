
import 'package:weather/models/weatherModel.dart';

class getWeatherStates {}

class initialState extends getWeatherStates {}
class weatherLoadedState extends getWeatherStates {
  final WeatherModel weatherModel ;

  weatherLoadedState(this.weatherModel);
}
class weatherFailureState extends getWeatherStates {}