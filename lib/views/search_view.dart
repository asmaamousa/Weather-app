import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/getweather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 64, 123, 225),
        title: const Text("Search a City",
        style: TextStyle(color: Colors.white),
      ),
     ) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
       // onChanged: (String value){
        //  print(value);
       // }
       onSubmitted: (value) async {
      var getweathercubit=  BlocProvider.of<GetWeathercubit>(context);
      getweathercubit.getweather(cityname: value);
        Navigator.pop(context);
        
       },
              decoration:InputDecoration(
                contentPadding:const  EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                suffixIcon: const Icon(Icons.search),
              labelText: "Search",

                hintText: 'Enter City Name',
            border: OutlineInputBorder(borderRadius:BorderRadius.circular(13),
            borderSide: const BorderSide(color: Colors.green)
              ),
            )  
            
            ),
        ),
      ),
     );


  }
}
