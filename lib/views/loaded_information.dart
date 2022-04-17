import '../model/info_model.dart';
import 'package:flutter/material.dart';

import '../screens/all_district_list.dart';

class LoadedInformation extends StatelessWidget {
  const LoadedInformation({Key? key, required this.information})
      : super(key: key);
  final List<InformationModel> information;

  void goToNextScreen(BuildContext context, int index, String disTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AllDistrictList(
          district: information,
          i: index,
          disTitle: disTitle,
        ),
      ),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0);
  }

// TODO:: This is the FIRST UI Screen
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        itemCount: information.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6.0,
            child: ListTile(
                onTap: () => goToNextScreen(
                    context, index, information[index].divisionName.toString()),
                title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      information[index].divisionName.toString(),
                      style: titleStyle(),
                    ))),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
      ),
    );
  }
}
