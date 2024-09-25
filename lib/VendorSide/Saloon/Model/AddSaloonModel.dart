class AddSaloonModel {
  bool? success;
  String? message;
  int? responseCode;
  Data? data;

  AddSaloonModel({this.success, this.message, this.responseCode, this.data});

  AddSaloonModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    responseCode = json['response_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['response_code'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userid;
  String? name;
  String? description;
  String? address;
  String? pincode;
  String? mobile;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userid,
        this.name,
        this.description,
        this.address,
        this.pincode,
        this.mobile,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    pincode = json['pincode'];
    mobile = json['mobile'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
