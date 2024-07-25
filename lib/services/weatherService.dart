import 'package:dio/dio.dart';
import 'package:weather/models/weatherModel.dart';

class weatherService
{
  final Dio dio ;
  final String baseUrl = 'https://api.weatherapi.com/v1' ;
  final String key = '9fc6c7f815154a819d0225154240303' ;
  weatherService(this.dio);
  Future <WeatherModel> getCurrentWeather({required String cityName}) async
   {
    try {
      Response response = await dio.get('$baseUrl/forecast.json?key=$key&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      print(response.data);
      return weatherModel ;
    } on DioException catch (e) {
      final String errorMess =e.response?.data['error']['message'] ?? 'Oops There Is An Error , Try Later';
      throw Exception(errorMess);
    }
    catch(e)
     {
       throw Exception(e);
     }
   }
}