import 'package:weather_app/models/weather_model.dart';

class WeatherState {
  
}

class WeatherInitialState extends WeatherState {
  
}
class  WeatherLoadedState extends WeatherState{
final  WeatherModle? weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState{
  final String errmessage;

  WeatherFailureState(this.errmessage);
}