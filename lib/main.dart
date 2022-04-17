import 'package:bd_vromon/bloc/country_bloc.dart';
import 'package:bd_vromon/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => CountryBloc()..add(GetAllInformationEvent()),
      child: const Home(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
