class HomeModel {
  String? message;
  Data? data;
  bool? success;

  HomeModel({this.message, this.data, this.success});

  HomeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;

    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<Null>? items;
  List<String>? images;

  Data({this.items, this.images});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      images = json['images'].cast<String>();
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();

      data['images'] = this.images;
      return data;
    }
  }
}
