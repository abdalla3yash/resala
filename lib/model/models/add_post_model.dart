class AddPostModel {
  String? message;
  Data? data;
  bool? success;

  AddPostModel({this.message, this.data, this.success});

  AddPostModel.fromJson(Map<String, dynamic> json) {
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
  String? activityInId;
  String? activityTypeId;
  String? details;
  String? activityDate;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.activityInId,
      this.activityTypeId,
      this.details,
      this.activityDate,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    activityInId = json['activity_in_id'];
    activityTypeId = json['activity_type_id'];
    details = json['details'];
    activityDate = json['activity_date'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_in_id'] = activityInId;
    data['activity_type_id'] = activityTypeId;
    data['details'] = details;
    data['activity_date'] = activityDate;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
