import '../model/info_model.dart';
import 'package:flutter/material.dart';

class DetailPlace extends StatelessWidget {
  const DetailPlace({
    Key? key,
    required this.information,
    required this.i,
    required this.ii,
    required this.iii,
    required this.placeName,
  }) : super(key: key);
  final List<InformationModel> information;
  final int i;
  final int ii;
  final int iii;
  final String placeName;
// TODO:: This is the FOURTH UI Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(placeName)),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Column(
          children: [
            Image.network(
                '${information[i].districtInfo![ii].viewablePlaces![iii].image}'),
            const SizedBox(height: 6.0),
            Text(
                '${information[i].districtInfo![ii].viewablePlaces![iii].name}'),
            const SizedBox(height: 5.0),
            Text(
                '${information[i].districtInfo![ii].viewablePlaces![iii].description}'),
            const SizedBox(height: 4.0),
            Text(
                '${information[i].districtInfo![ii].viewablePlaces![iii].howToGo}'),
          ],
        ),
      ),
    );
  }
}
