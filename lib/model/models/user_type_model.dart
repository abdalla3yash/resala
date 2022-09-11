class UserType {
  bool? status;
  List<UserTypeData>? data;

  UserType({this.status, this.data});

  UserType.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <UserTypeData>[];
      json['data'].forEach((v) {
        data!.add(
          UserTypeData.fromJson(v),
        );
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

class UserTypeData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  UserTypeData({this.id, this.name, this.createdAt, this.updatedAt});

  UserTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
