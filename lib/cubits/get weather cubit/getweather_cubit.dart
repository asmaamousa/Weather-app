import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../services/weather_service.dart';

class GetWeathercubit extends Cubit<WeatherState>
 {
  GetWeathercubit() : super(WeatherInitialState());
   WeatherModle? weatherModel;
  getweather({required String cityname})async
  {
    try {
         weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: cityname);
         emit(WeatherLoadedState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }

        
         
  }
}