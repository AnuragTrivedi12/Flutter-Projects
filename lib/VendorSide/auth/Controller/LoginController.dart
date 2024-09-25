import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_SharedPreferences.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/LoginModel.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Screen/otpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  var loading = false.obs;
  var oldResponse = LoginModel().obs;

  TextEditingController mobileNumber = TextEditingController();

  Future<void> loginContFun(Mobile_Number) async{
    try {
      loading(true);
      final newResponse = await ApiServices().login(Mobile_Number);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        SharedPreferences saloon = await SharedPreferences.getInstance();
        saloon.setString("otpid", oldResponse.value.data!.userId.toString());
        // Get.snackbar("Login", oldResponse.value.message.toString());

        Get.to(()=> OtpScreen(userId: oldResponse.value.data!.userId.toString(),));

        print("LoginContFun called");
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("Login", oldResponse.value.message.toString());

        print("LoginContFun failed");
      }
    } on Exception catch (e) {
      loading(false);
    }finally{
      loading(false);

    }
  }
}