class GetSaloonModel {
  bool? success;
  String? message;
  int? responseCode;
  List<Data>? data;

  GetSaloonModel({this.success, this.message, this.responseCode, this.data});

  GetSaloonModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    responseCode = json['response_code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userid;
  String? name;
  String? address;
  int? pincode;
  String? image;
  String? service;
  String? mobile;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<String>? imagePaths;

  Data(
      {this.id,
        this.userid,
        this.name,
        this.address,
        this.pincode,
        this.image,
        this.service,
        this.mobile,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.imagePaths});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    name = json['name'];
    address = json['address'];
    pincode = json['pincode'];
    image = json['image'];
    service = json['Service'];
    mobile = json['mobile'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePaths = json['image_paths'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['Service'] = this.service;
    data['mobile'] = this.mobile;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_paths'] = this.imagePaths;
    return data;
  }
}
