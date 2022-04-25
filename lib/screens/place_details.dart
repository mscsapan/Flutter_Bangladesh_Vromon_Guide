import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String howToGo;

  const PlaceDetailsScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.howToGo})
      : super(key: key);

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  String extraHowToGoText = 'যাওয়ার উপায়';

  bool topToBottom = false;

  topBottom() {
    setState(() {
      topToBottom = !topToBottom;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  TextStyle titleStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        color: Colors.green,
        fontFamily: 'Siliguri-Regular',
        letterSpacing: 2.0);
  }

  TextStyle descriptionStyle() {
    return const TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: 'Siliguri-Medium',
        fontSize: 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(widget.image, fit: BoxFit.cover),
            Positioned(
              left: 10.0,
              top: 40.0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.2,
              maxChildSize: 0.6,
              builder: (context, controller) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: ListView(
                    controller: controller,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Visibility(
                        visible: true,
                        child: IconButton(
                            onPressed: () => topBottom(),
                            icon: topToBottom
                                ? const Icon(Icons.arrow_drop_up, size: 30.0)
                                : const Icon(Icons.arrow_drop_down,
                                    size: 30.0)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 5, top: 10),
                          child: Text(widget.name.toUpperCase(),
                              style: titleStyle())),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.description,
                            style: descriptionStyle(),
                            textAlign: TextAlign.justify),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${widget.name} $extraHowToGoText: ${widget.howToGo}',
                            style: descriptionStyle(),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
