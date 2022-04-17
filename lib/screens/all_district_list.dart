import '../screens/district_information.dart';

import '../model/info_model.dart';
import 'package:flutter/material.dart';

class AllDistrictList extends StatelessWidget {
  const AllDistrictList(
      {Key? key,
      required this.district,
      required this.i,
      required this.disTitle})
      : super(key: key);
  final List<InformationModel> district;
  final int i;
  final String disTitle;

  void goToDistrictInformation(
      BuildContext context, int index, String disTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DistrictInformation(
          district: district,
          i: i,
          ii: index,
          disTitle: disTitle,
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w600, letterSpacing: 1.5);
  }

// TODO:: This is the Second UI Screen

  final String title = 'বিভাগের জেলা সূমহ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$disTitle $title'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: GridView.builder(
          itemCount: district[i].districtInfo!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              child: ListTile(
                onTap: () => goToDistrictInformation(context, index,
                    district[i].districtInfo![index].districtName.toString()),
                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    district[i].districtInfo![index].districtName.toString(),
                    style: titleStyle(),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2),
        ),
      ),
    );
  }
}
