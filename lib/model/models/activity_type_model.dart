class ActivityTypeModel {
  String? message;
  List<Data>? data;
  bool? success;

  ActivityTypeModel({this.message, this.data, this.success});

  ActivityTypeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? activityInId;
  String? activityInName;

  Data({this.id, this.name, this.activityInId, this.activityInName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    activityInId = json['activity_in_id'];
    activityInName = json['activityInName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['activity_in_id'] = activityInId;
    data['activityInName'] = activityInName;
    return data;
  }
}
