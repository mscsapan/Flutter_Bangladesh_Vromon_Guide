import 'package:flutter/material.dart';

import '../model/info_model.dart';
import '../screens/all_district_list.dart';
import 'custom_title_container.dart';

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
    return const TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.w400, fontFamily: 'Regular');
  }

  ListTile disName(BuildContext context, int index) {
    return ListTile(
      onTap: () => goToNextScreen(
          context, index, information[index].divisionName.toString()),
      title: Align(
        alignment: Alignment.center,
        child: Text(
          information[index].divisionName.toString(),
          style: titleStyle(),
        ),
      ),
    );
  }

// TODO:: This is the FIRST UI Screen
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemCount: information.length,
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      itemBuilder: (context, index) {
        return CustomTitleContainer(
          child: disName(context, index),
          width: _size.width / 2.0,
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.15,
      ),
    );
  }
}
