// ignore: camel_case_types
class registerModel {
  String? message;
  Data? data;
  bool? success;

  registerModel({this.message, this.data, this.success});

  registerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? userName;
  String? mobile;
  String? nationalId;
  String? birthDate;
  String? image;
  String? email;
  String? userTypeId;
  String? apiToken;

  Data(
      {this.id,
      this.name,
      this.userName,
      this.mobile,
      this.nationalId,
      this.birthDate,
      this.image,
      this.email,
      this.userTypeId,
      this.apiToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    mobile = json['mobile'];
    nationalId = json['national_id'];
    birthDate = json['birth_date'];
    image = json['image'];
    email = json['email'];
    userTypeId = json['user_type_id'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_name'] = userName;
    data['mobile'] = mobile;
    data['national_id'] = nationalId;
    data['birth_date'] = birthDate;
    data['image'] = image;
    data['email'] = email;
    data['user_type_id'] = userTypeId;
    data['api_token'] = apiToken;
    return data;
  }
}
