import 'package:flutter/material.dart';

class CustomTitleContainer extends StatelessWidget {
  const CustomTitleContainer(
      {Key? key, required this.child, required this.width})
      : super(key: key);
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            color: Colors.grey[500]!,
            blurRadius: 15.0,
            spreadRadius: 1,
          ),
          const BoxShadow(
            offset: Offset(-5, -5),
            color: Colors.white,
            blurRadius: 15.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
