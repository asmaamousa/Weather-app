import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather }) : super(key: key);
final WeatherModle weather;
  @override
  Widget build(BuildContext context) {
  WeatherModle? weathermodel=  BlocProvider.of<GetWeathercubit>(context).weatherModel;
    return Container(
      decoration:   BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weathermodel?.weathercondition),
          getThemeColor(weathermodel?.weathercondition)[300]!,
          getThemeColor(weathermodel?.weathercondition)[50]!],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
          
          Text(
       weathermodel!.cityname,
       style: const TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 32,
       ),
                ),
      
      
      
             Text(
              'updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weathermodel.image!,
                ),
      
      
                 Text( weathermodel.temp.toString(),
        style:const  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      
      
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weathermodel.maxtemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weathermodel.mintemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
      
            const SizedBox(
              height: 32,
            ),
      
      
      
            Text(
        weathermodel.weathercondition,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
          ],
        ),
      ),
    );
  }
}





