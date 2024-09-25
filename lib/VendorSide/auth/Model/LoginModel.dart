class LoginModel {
  bool? success;
  String? message;
  int? responseCode;
  Data? data;

  LoginModel({this.success, this.message, this.responseCode, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? otp;
  int? userId;

  Data({this.token, this.otp, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    otp = json['otp'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['otp'] = this.otp;
    data['user_id'] = this.userId;
    return data;
  }
}
