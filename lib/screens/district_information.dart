import '../screens/place_details.dart';
import 'package:flutter/material.dart';

import '../model/info_model.dart';

class DistrictInformation extends StatelessWidget {
  const DistrictInformation(
      {Key? key,
      required this.district,
      required this.i,
      required this.ii,
      required this.disTitle})
      : super(key: key);
  final List<InformationModel> district;
  final int i;
  final int ii;
  final String disTitle;

  void goToDetailPlaceScreen(
      BuildContext context, int index, String placeName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPlace(
          information: district,
          i: i,
          ii: ii,
          iii: index,
          placeName: placeName,
        ),
      ),
    );
  }

// TODO:: This is the THIRD UI Screen
  final String title = 'জেলার দর্শনীয় স্থান সূমহ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$disTitle $title')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GridView.builder(
          itemCount: district[i].districtInfo![ii].viewablePlaces!.length,
          itemBuilder: (context, position) {
            var result =
                district[i].districtInfo![ii].viewablePlaces![position];
            return Card(
              elevation: 5.0,
              child: ListTile(
                onTap: () => goToDetailPlaceScreen(
                    context, position, result.name.toString()),
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    result.name.toString(),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
        ),
      ),
    );
  }
}