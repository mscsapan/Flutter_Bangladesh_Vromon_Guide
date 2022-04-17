/*
import 'dart:convert';

List<InformationModel> informationModelFromJson(String str) =>
    List<InformationModel>.from(
        json.decode(str).map((x) => InformationModel.fromJson(x)));

String informationModelToJson(List<InformationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InformationModel {
  InformationModel({
    this.divisionName,
    this.districtInfo,
  });

  String? divisionName;
  List<DistrictInfo>? districtInfo;

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        divisionName: json["divisionName"],
        districtInfo: List<DistrictInfo>.from(
            json["districtInfo"].map((x) => DistrictInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "divisionName": divisionName,
        "districtInfo":
            List<dynamic>.from(districtInfo!.map((x) => x.toJson())),
      };
}

class DistrictInfo {
  DistrictInfo({
    this.districtName,
    this.viewablePlaces,
  });

  String? districtName;
  List<ViewablePlace>? viewablePlaces;

  factory DistrictInfo.fromJson(Map<String, dynamic> json) => DistrictInfo(
        districtName: json["districtName"],
        viewablePlaces: List<ViewablePlace>.from(
            json["viewablePlaces"].map((x) => ViewablePlace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "districtName": districtName,
        "viewablePlaces":
            List<dynamic>.from(viewablePlaces!.map((x) => x.toJson())),
      };
}

class ViewablePlace {
  ViewablePlace({
    this.name,
    this.image,
    this.description,
    this.howToGo,
  });

  String? name;
  String? image;
  String? description;
  String? howToGo;

  factory ViewablePlace.fromJson(Map<String, dynamic> json) => ViewablePlace(
        name: json["name"],
        image: json["image"],
        description: json["description"],
        howToGo: json["howToGo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
        "howToGo": howToGo,
      };
}
*/

class InformationModel {
  String? divisionName;
  List<DistrictInfo>? districtInfo;

  InformationModel({this.divisionName, this.districtInfo});

  InformationModel.fromJson(Map<String, dynamic> json) {
    divisionName = json['divisionName'];
    if (json['districtInfo'] != null) {
      districtInfo = <DistrictInfo>[];
      json['districtInfo'].forEach((v) {
        districtInfo!.add(new DistrictInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['divisionName'] = this.divisionName;
    if (this.districtInfo != null) {
      data['districtInfo'] = this.districtInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictInfo {
  String? districtName;
  List<ViewablePlaces>? viewablePlaces;

  DistrictInfo({this.districtName, this.viewablePlaces});

  DistrictInfo.fromJson(Map<String, dynamic> json) {
    districtName = json['districtName'];
    if (json['viewablePlaces'] != null) {
      viewablePlaces = <ViewablePlaces>[];
      json['viewablePlaces'].forEach((v) {
        viewablePlaces!.add(new ViewablePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtName'] = this.districtName;
    if (this.viewablePlaces != null) {
      data['viewablePlaces'] =
          this.viewablePlaces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewablePlaces {
  String? name;
  String? image;
  String? description;
  String? howToGo;

  ViewablePlaces({this.name, this.image, this.description, this.howToGo});

  ViewablePlaces.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    howToGo = json['howToGo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['howToGo'] = this.howToGo;
    return data;
  }
}
