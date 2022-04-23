import 'package:bd_vromon/views/custom_title_container.dart';

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
      fontSize: 25.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'Siliguri-Regular',
    );
  }

// TODO:: This is the Second UI Screen

  final String title = 'বিভাগের জেলা সূমহ';
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text(
            '$disTitle $title',
            style: titleStyle().copyWith(fontSize: 20.0),
          ),
          centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: GridView.builder(
          itemCount: district[i].districtInfo!.length,
          itemBuilder: (context, index) {
            return CustomTitleContainer(
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
                width: _size.width / 2.0);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2),
        ),
      ),
    );
  }
}
