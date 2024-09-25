import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_baseURL.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Model/AddSaloonModel.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Model/AddSaloonServiceModel.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Model/GetSaloonModel.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Service/Model/GetAllSaloonServicesModel.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/LoginModel.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/OtpModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../TabBarScreens/Orders/UpcomingOrders/Model/GetAllBookingModel.dart';
import '../TabBarScreens/Orders/UpcomingOrders/Model/OrderUpdateModel.dart';
import '../TabBarScreens/Service/Model/AddServiceModel.dart';
import '../TabBarScreens/Stylist/Model/AddStylistModel.dart';
import '../TabBarScreens/Stylist/Model/GetAllStylistModel.dart';
import '../auth/Model/RegisterModel.dart';

class ApiServices{

  // Dio dio = Dio();

  Dio dio = Dio()..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90)
  );

  Future<RegisterModel> register(First_Name,Last_Name,Mobile_Number,Email,Gender,Birth_Date,Pincode,Address) async{
    FormData userForm = FormData();
    userForm.fields.add(MapEntry("First_Name", First_Name));
    userForm.fields.add(MapEntry("Last_Name", Last_Name));
    userForm.fields.add(MapEntry("Mobile_Number", Mobile_Number));
    userForm.fields.add(MapEntry("Email", Email));
    userForm.fields.add(MapEntry("Gender", Gender));
    userForm.fields.add(MapEntry("Birth_Date", Birth_Date));
    userForm.fields.add(MapEntry("Pincode", Pincode));
    userForm.fields.add(MapEntry("Address", Address));
    userForm.fields.add(MapEntry("type", "0"));

    final userValue = await dio.post("${baseUrl}/register",data: userForm);

    if(userValue.statusCode == 200){
      final result = RegisterModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }                                    

  Future<LoginModel> login(Mobile_Number) async{
    FormData loginForm = FormData();
    loginForm.fields.add(MapEntry("Mobile_Number", Mobile_Number));

    final loginValue = await dio.post("${baseUrl}/login",data: loginForm);

    if(loginValue.statusCode == 200){
      final result = LoginModel.fromJson(loginValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<OtpModel> otpVerification(OTP, userId) async{

    FormData otpForm = FormData();
    otpForm.fields.add(MapEntry("OTP", OTP));
    otpForm.fields.add(MapEntry("userid", userId));

    final otpValue = await dio.post("${baseUrl}/OTP",data: otpForm);
    if(otpValue.statusCode == 200){
      final result = OtpModel.fromJson(otpValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<GetSaloonModel> getSaloon() async{

    SharedPreferences saloon = await SharedPreferences.getInstance();
    var token = saloon.getString("userToken");
    var user_id = saloon.getString("userId");
    if (kDebugMode) {
      print("Token: $token");
      print("user_id: $user_id");
    }


    dio.options.headers['Authorization'] = 'Bearer $token';

    final userValue = await dio.get("$baseUrl/getSaloons");
    if(userValue.statusCode == 200){
      final result = GetSaloonModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<AddSaloonModel> addSaloon(userid,name,List image,description,address,pincode,mobile) async{

    FormData saloonForm = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();

    dio.options.headers["Authorization"] = "Bearer ${saloon.getString("userToken")}";

    saloonForm.fields.add(MapEntry("userid", userid));
    saloonForm.fields.add(MapEntry("name", name));
    image.forEach((element) {
      saloonForm.files.add(MapEntry("image[]", MultipartFile.fromFileSync(element.path,filename: element.path.split(Platform.pathSeparator).last)));
    });
    saloonForm.fields.add(MapEntry("description", description));
    saloonForm.fields.add(MapEntry("address", address));
    saloonForm.fields.add(MapEntry("pincode", pincode));
    saloonForm.fields.add(MapEntry("mobile", mobile));
    
    final formValue = await dio.post("$baseUrl/AddSaloon",data: saloonForm);

    if(formValue.statusCode == 200){
      final result = AddSaloonModel.fromJson(formValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<AddSaloonServiceModel> addSaloonService(saloonId,service) async{
    FormData saloonService = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();

    dio.options.headers["Authorization"] = "Bearer ${saloon.getString("userToken")}";
    
    saloonService.fields.add(MapEntry("saloonid", saloonId));
    saloonService.fields.add(MapEntry("service", service));
    
    final valueService = await dio.post("$baseUrl/AddSaloonService",data: saloonService);

    if(valueService.statusCode == 200){
      final result = AddSaloonServiceModel.fromJson(valueService.data);
      return result;
    }else{
      throw "Something Went Wrong....";
    }
  }

  Future<GetAllBookingModel> getAllBookingbySaloon(saloonId) async{
    FormData bookingService = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();
    var token = saloon.getString("userToken");
    if (kDebugMode) {
      print("Token: $token");
    }

    dio.options.headers['Authorization'] = 'Bearer $token';
    
    bookingService.fields.add(MapEntry("saloonid", saloonId));

    final valueBooking = await dio.post("$baseUrl/getAllBookingBySaloon",data: bookingService);

    if(valueBooking.statusCode == 200){
      final result = GetAllBookingModel.fromJson(valueBooking.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }


  Future<OrderUpdateModel> orderUpdate(appointmentId, orderStatus) async{
    FormData orderForm = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();
    dio.options.headers["Authorization"] = "Bearer ${saloon.getString("userToken")}";

    orderForm.fields.add(MapEntry("AppoinmentId", appointmentId));
    orderForm.fields.add(MapEntry("OrderStatus", orderStatus));

    final orderValue = await dio.post("$baseUrl/UpdateOrderStatus",data: orderForm);

    if(orderValue.statusCode == 200){
      final result = OrderUpdateModel.fromJson(orderValue.data);
      return result;
    }
    throw "Something Went Wrong";
  }

  Future<GetAllSaloonServicesModel> getAllServices(saloonId) async{

    FormData userForm = FormData();
    SharedPreferences saloon = await SharedPreferences.getInstance();
    var token = saloon.getString("userToken");
    if(kDebugMode){
      print("Token: $token}");
    }
    
    dio.options.headers['Authorization'] = 'Bearer $token';

    userForm.fields.add(MapEntry("saloonid", saloonId));

    final userValue = await dio.post("$baseUrl/getVendorServices",data: userForm);
    if(userValue.statusCode == 200){
      final result = GetAllSaloonServicesModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong";
    }
  }


  Future<AddServiceModel> addService(saloonId,name,description,price,List images,Stylist,Product,Category,GenderType)async{
    FormData userForm = FormData();
    SharedPreferences saloon = await SharedPreferences.getInstance();
    dio.options.headers["Authorization"] = "Bearer ${saloon.getString("userToken")}";
    
    userForm.fields.add(MapEntry("saloonid", saloonId));
    userForm.fields.add(MapEntry("userid", saloon.getString("otpid").toString()));
    userForm.fields.add(MapEntry("name", name));
    userForm.fields.add(MapEntry("description", description));
    userForm.fields.add(MapEntry("price", price));
    images.forEach((element) {
      userForm.files.addAll([
        MapEntry("images[]", MultipartFile.fromFileSync(element.path,filename: element.path.split(Platform.pathSeparator).last))
      ]);
    });
    userForm.fields.add(MapEntry("Stylist", Stylist));
    userForm.fields.add(MapEntry("Product", Product));
    userForm.fields.add(MapEntry("Category", Category));
    userForm.fields.add(MapEntry("GenderType", GenderType));

    final userValue = await dio.post("$baseUrl/AddService",data: userForm);
    if(userValue.statusCode == 200){
      final result = AddServiceModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<GetAllStylistModel> getAllStylist(saloonId) async{
    FormData userForm = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();
    var token = saloon.getString("userToken");
    dio.options.headers['Authorization'] = 'Bearer $token';

    userForm.fields.add(MapEntry("saloonid", saloonId));

    final userValue = await dio.post("$baseUrl/getVendorStylists",data: userForm);
    if(userValue.statusCode == 200){
      final result = GetAllStylistModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong...";
    }
  }

  Future<AddStylistModel> addStylist(saloonId,name,title,workingDate, workingHour,List images) async{
    FormData userForm = FormData();

    SharedPreferences saloon = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] = 'Bearer ${saloon.getString("userToken")}';

    userForm.fields.add(MapEntry("saloonid", saloonId));
    userForm.fields.add(MapEntry("userid", saloon.getString("otpid").toString()));
    userForm.fields.add(MapEntry("name", name));
    userForm.fields.add(MapEntry("title", title));
    userForm.fields.add(MapEntry("working_date", workingDate));
    userForm.fields.add(MapEntry("working_hour", workingHour));
    images.forEach((element) {
      userForm.files.addAll([
        MapEntry("image[]", MultipartFile.fromFileSync(element.path,filename: element.path.split(Platform.pathSeparator).last))
      ]);
    });

    final userValue = await dio.post("$baseUrl/AddStylist",data: userForm);

    if(userValue.statusCode == 200){
      final result =AddStylistModel.fromJson(userValue.data);
      return result;
    }else{
      throw "Something Went Wrong";
    }
  }
}