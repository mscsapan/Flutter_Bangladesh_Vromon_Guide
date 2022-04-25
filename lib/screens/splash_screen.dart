import 'dart:math' as math;

import '../screens/browsing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bloc/country_bloc.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /* late AnimationController _animationController;
  late Animation<double> _animation;*/

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () => navigateScreen(),
    );
    // myAnimation();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
  }

  navigateScreen() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CountryBloc()
            ..add(
              GetAllInformationEvent(),
            ),
          child: BrowsScreen(),
        ),
      ),
    );
  }

/*  void myAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: math.pi * 2)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    _animationController.repeat();
  }*/

  @override
  void dispose() {
    super.dispose();
    // _animationController.dispose();
  }

  final String bangladesh = 'asset/bd-earth.png';

  TextStyle developStyle() {
    return Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14.0);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        height: _size.height,
        width: _size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: _size.height * 0.1),
            Container(
              height: _size.height * 0.34,
              width: _size.width,
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: const BoxDecoration(
                // color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Image.asset(bangladesh),
            ),
            const SpinKitFadingCircle(color: Colors.grey),
            SizedBox(height: _size.height * 0.2),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Developed by ', style: developStyle()),
                  TextSpan(
                    text: 'S❤S🦜',
                    style: developStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
