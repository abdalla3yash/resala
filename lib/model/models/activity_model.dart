class ActivityModel {
  String? message;
  List<ActivityData>? data;
  bool? success;

  ActivityModel({this.message, this.data, this.success});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ActivityData>[];
      json['data'].forEach((v) {
        data!.add(ActivityData.fromJson(v));
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

class ActivityData {
  int? id;
  String? details;
  String? activityDate;
  String? userId;
  String? userName;
  String? activityInName;
  String? activityTypeName;

  ActivityData(
      {this.id,
      this.details,
      this.activityDate,
      this.userId,
      this.userName,
      this.activityInName,
      this.activityTypeName});

  ActivityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    activityDate = json['activity_date'];
    userId = json['user_id'];
    userName = json['userName'];
    activityInName = json['activityInName'];
    activityTypeName = json['activityTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['details'] = details;
    data['activity_date'] = activityDate;
    data['user_id'] = userId;
    data['userName'] = userName;
    data['activityInName'] = activityInName;
    data['activityTypeName'] = activityTypeName;
    return data;
  }
}
