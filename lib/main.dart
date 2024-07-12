import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeathercubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeathercubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeathercubit>(context).weatherModel?.weathercondition)),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition) {
      case 'Sunny':
        return Colors.amber;
      case 'Clear':
        return Colors.blue;
      case 'Partly cloudy':
        return Colors.yellow;
      case 'Cloudy':
        return Colors.grey;
      case 'Overcast':
        return Colors.grey;
      case 'Mist':
        return Colors.grey;
      case 'Patchy rain possible':
        return Colors.lightBlue;
      case 'Patchy snow possible':
        return Colors.grey;
      case 'Patchy sleet possible':
        return Colors.grey;
      case 'Patchy freezing drizzle possible':
        return Colors.grey;
      case 'Thundery Outbreaks Possible':
        return Colors.deepPurple;
      case 'Blowing snow':
        return Colors.blueGrey;
      case 'Blizzard':
        return Colors.cyan;
      case 'Fog':
        return Colors.grey;
      case 'Freezing fog':
        return Colors.grey;
      case 'Patchy light drizzle':
        return Colors.lightBlue;
      case 'Light drizzle':
        return Colors.lightBlue;
      case 'Freezing drizzle':
        return Colors.lightBlue;
      case 'Heavy freezing drizzle':
        return Colors.lightBlue;
      case 'Patchy light rain':
        return Colors.lightBlue;
      case 'Light rain':
        return Colors.lightBlue;
      case 'Moderate rain at times':
        return Colors.blue;
      case 'Moderate rain':
        return Colors.blue;
      case 'Heavy rain at times':
        return Colors.blue;
      case 'Heavy rain':
        return Colors.blue;
      case 'Light freezing rain':
        return Colors.lightBlue;
      case 'Moderate or heavy freezing rain':
        return Colors.lightBlue;
      case 'Light sleet':
        return Colors.grey;
      case 'Moderate or heavy sleet':
        return Colors.grey;
      case 'Patchy light snow':
        return Colors.grey;
      case 'Light snow':
        return Colors.grey;
      case 'Patchy moderate snow':
        return Colors.grey;
      case 'Moderate snow':
        return Colors.grey;
      case 'Patchy heavy snow':
        return Colors.grey;
      case 'Heavy snow':
        return Colors.grey;
      case 'Ice pellets':
        return Colors.grey;
      case 'Light rain shower':
        return Colors.lightBlue;
      case 'Moderate or heavy rain shower':
        return Colors.blue;
      case 'Torrential rain shower':
        return Colors.blue;
      case 'Light sleet showers':
        return Colors.grey;
      case 'Moderate or heavy sleet showers':
        return Colors.grey;
      case 'Light snow showers':
        return Colors.grey;
      case 'Moderate or heavy snow showers':
        return Colors.grey;
      case 'Light showers of ice pellets':
        return Colors.grey;
      case 'Moderate or heavy showers of ice pellets':
        return Colors.grey;
      case 'Patchy light rain with thunder':
        return Colors.deepPurple;
      case 'Moderate or heavy rain with thunder':
        return Colors.deepPurple;
      case 'Patchy light snow with thunder':
        return Colors.deepPurple;
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;
      default:
        return Colors.blue;
    }
  }

