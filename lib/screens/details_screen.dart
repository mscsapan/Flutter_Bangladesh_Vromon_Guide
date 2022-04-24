import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.description})
      : super(key: key);
  final String image;
  final String name;
  final String description;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  // TODO: This is the LAST SCREEN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(widget.image, fit: BoxFit.cover),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: IconButton(
                onPressed: () => goBack(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
