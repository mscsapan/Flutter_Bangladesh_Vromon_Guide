class InformationModel {
  String? divisionName;
  List<DistrictInfo>? districtInfo;

  InformationModel({divisionName, districtInfo});

  InformationModel.fromJson(Map<String, dynamic> json) {
    divisionName = json['divisionName'];
    if (json['districtInfo'] != null) {
      districtInfo = <DistrictInfo>[];
      json['districtInfo'].forEach((v) {
        districtInfo!.add(DistrictInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['divisionName'] = divisionName;
    if (districtInfo != null) {
      data['districtInfo'] = districtInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DistrictInfo {
  String? districtName;
  List<ViewablePlaces>? viewablePlaces;

  DistrictInfo({districtName, viewablePlaces});

  DistrictInfo.fromJson(Map<String, dynamic> json) {
    districtName = json['districtName'];
    if (json['viewablePlaces'] != null) {
      viewablePlaces = <ViewablePlaces>[];
      json['viewablePlaces'].forEach((v) {
        viewablePlaces!.add(ViewablePlaces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['districtName'] = districtName;
    if (viewablePlaces != null) {
      data['viewablePlaces'] = viewablePlaces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewablePlaces {
  String? name;
  String? image;
  String? description;
  String? howToGo;

  ViewablePlaces({name, image, description, howToGo});

  ViewablePlaces.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    howToGo = json['howToGo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['howToGo'] = howToGo;
    return data;
  }
}
