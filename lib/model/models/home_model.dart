class HomeModel {
  String? message;
  Data? data;
  bool? success;

  HomeModel({this.message, this.data, this.success});

  HomeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    return data;
  }
}

class Data {
  List<String>? images;

  Data({this.images});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      images = json['images'].cast<String>();
    }
  }
}
