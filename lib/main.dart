import '../bloc/country_bloc.dart';
import '../screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/custom_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => CountryBloc()..add(GetAllInformationEvent()),
        child: const Home(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
/*
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomCard(),
    ),
  );
}*/
