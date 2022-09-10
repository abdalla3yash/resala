class RegisterModel {
  String? message;
  Data? data;
  bool? success;

  RegisterModel({this.message, this.data, this.success});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['mobile'] = this.mobile;
    data['national_id'] = this.nationalId;
    data['birth_date'] = this.birthDate;
    data['image'] = this.image;
    data['email'] = this.email;
    data['user_type_id'] = this.userTypeId;
    data['api_token'] = this.apiToken;
    return data;
  }
}
