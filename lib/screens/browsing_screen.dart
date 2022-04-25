import 'package:fluttertoast/fluttertoast.dart';

import '../screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_bloc.dart';

class BrowsScreen extends StatelessWidget {
  BrowsScreen({Key? key}) : super(key: key);

  allDivisionScreen(BuildContext context) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CountryBloc()
            ..add(
              GetAllInformationEvent(),
            ),
          child: const Home(),
        ),
      ),
    );
  }

  DateTime _currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final differenceTime = DateTime.now().difference(_currentTime);
        final exitApp = differenceTime >= const Duration(seconds: 2);
        _currentTime = DateTime.now();
        if (exitApp) {
          Fluttertoast.showToast(
            backgroundColor: Colors.grey,
            msg: 'Press back again to exit',
            textColor: Colors.black54,
            fontSize: 18.0,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Container(
            width: double.infinity,
            height: 50.0,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () => allDivisionScreen(context),
              child: const Text(
                'Show All Division',
                style: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
