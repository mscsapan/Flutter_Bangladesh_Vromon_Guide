import 'dart:convert';

import '../model/info_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  final String url = 'https://bd-vromon.herokuapp.com/travel/data';

  Future<List<InformationModel>> getAllInformation() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> tempData = data;
      List<InformationModel> details =
          tempData.map((f) => InformationModel.fromJson(f)).toList();
      return details;
    } else {
      throw Exception('FAILED TO GET DATA...😢');
    }
  }
}
