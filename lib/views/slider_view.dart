import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CarouselView extends StatelessWidget {
  CarouselView({Key? key}) : super(key: key);

  final List<String> images = [
    'asset/1.jpg',
    'asset/2.jpg',
    'asset/3.jpg',
    'asset/4.jpg',
    'asset/5.jpg',
    'asset/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: Swiper(
        itemCount: images.length,
        itemBuilder: (context, int itemIndex) {
          return Image.asset(
            images[itemIndex],
            fit: BoxFit.cover,
            height: 240.0,
            width: double.infinity,
          );
        },
        autoplay: true,
      ),
    );
  }
}
