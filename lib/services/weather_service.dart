import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl="https://api.weatherapi.com/v1";
  final String apiKey="174de371ce9348a4aa1221522241203";
WeatherService( this.dio);


Future<WeatherModle?> getCurrentWeather({required String cityName})async{

try {
  

  Response response= await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
    WeatherModle weathermodel=WeatherModle.fromJason(response.data);
    return weathermodel;
}
on DioException catch (e) {
  final String errMessage=e.response?.data['error']['message']?? 'oops there was an error';
  throw Exception(errMessage);
  
}
catch (e){
  log(e.toString());
  throw Exception('oops there was an error');

}
}
}
