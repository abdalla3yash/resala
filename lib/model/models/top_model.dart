class TopModel {
  bool? status;
  List<Data>? data;

  TopModel({this.status, this.data});

  TopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? image;
  String? activityCount;
  String? userTypeId;
  String? userTypeName;

  Data(
      {this.id,
      this.userName,
      this.image,
      this.activityCount,
      this.userTypeId,
      this.userTypeName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    image = json['image'];
    activityCount = json['activityCount'];
    userTypeId = json['user_type_id'];
    userTypeName = json['user_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['image'] = image;
    data['activityCount'] = activityCount;
    data['user_type_id'] = userTypeId;
    data['user_type_name'] = userTypeName;
    return data;
  }
}
