class RegisterModel {
  int? id;
  String? name;
  String? userName;
  String? mobile;
  String? nationalId;
  String? birthDate;
  String? image;
  String? email;
  String? userTypeId;

  RegisterModel({
    this.id,
    this.name,
    this.userName,
    this.mobile,
    this.nationalId,
    this.birthDate,
    this.image,
    this.email,
    this.userTypeId,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    mobile = json['mobile'];
    nationalId = json['national_id'];
    birthDate = json['birth_date'];
    image = json['image'];
    email = json['email'];
    userTypeId = json['user_type_id'];
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
    return data;
  }
}
