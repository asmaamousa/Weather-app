import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color.fromARGB(255, 64, 123, 225),
        actions: [IconButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const  SearchView();
        }) );

        }, icon:const Icon(Icons.search ,color: Colors.white,))],
      ),
      body:BlocBuilder<GetWeathercubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherInitialState){
            return const NoWeatherBody();
          } 
          else if(state is WeatherLoadedState){
            return   WeatherInfoBody(weather: state.weatherModel!,);
          }
          else{
return const Text("oops there was an error");
          }
        },
      )
      
       
    );
  }
}
