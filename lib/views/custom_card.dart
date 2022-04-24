import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);
  final String image;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 320.0,
      width: _size.width,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            SizedBox(
              height: 250.0,
              child: Stack(
                children: [
                  const Center(
                      child: SpinKitThreeBounce(
                    color: Colors.grey,
                    size: 20.0,
                  )),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: image,
                      height: 250.0,
                      width: _size.width,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70.0,
              width: _size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Siliguri-Medium',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 20.0,
                        // fontWeight: FontWeight.w400,
                        fontFamily: 'Siliguri-Regular',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
