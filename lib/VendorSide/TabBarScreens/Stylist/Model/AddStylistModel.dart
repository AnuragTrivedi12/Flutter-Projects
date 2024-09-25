class AddStylistModel {
  bool? success;
  String? message;
  int? responseCode;
  Data? data;

  AddStylistModel({this.success, this.message, this.responseCode, this.data});

  AddStylistModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? workingDate;
  String? workingHour;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.saloonid,
        this.userid,
        this.name,
        this.title,
        this.workingDate,
        this.workingHour,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    saloonid = json['saloonid'];
    userid = json['userid'];
    name = json['name'];
    title = json['title'];
    workingDate = json['working_date'];
    workingHour = json['working_hour'];
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
    data['title'] = this.title;
    data['working_date'] = this.workingDate;
    data['working_hour'] = this.workingHour;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
