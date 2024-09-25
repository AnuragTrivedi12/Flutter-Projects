class AddServiceModel {
  bool? success;
  String? message;
  int? responseCode;
  Data? data;

  AddServiceModel({this.success, this.message, this.responseCode, this.data});

  AddServiceModel.fromJson(Map<String, dynamic> json) {
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
  String? saloonid;
  String? userid;
  String? name;
  String? description;
  String? price;
  String? stylist;
  String? product;
  String? genderType;
  String? category;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.saloonid,
        this.userid,
        this.name,
        this.description,
        this.price,
        this.stylist,
        this.product,
        this.genderType,
        this.category,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    saloonid = json['saloonid'];
    userid = json['userid'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stylist = json['Stylist'];
    product = json['Product'];
    genderType = json['GenderType'];
    category = json['Category'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saloonid'] = this.saloonid;
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['Stylist'] = this.stylist;
    data['Product'] = this.product;
    data['GenderType'] = this.genderType;
    data['Category'] = this.category;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
