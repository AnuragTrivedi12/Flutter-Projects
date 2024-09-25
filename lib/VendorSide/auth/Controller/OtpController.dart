import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_SharedPreferences.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Screen/saloonListScreen.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/OtpModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController{
  var loading = false.obs;
  var oldResponse = OtpModel().obs;

  TextEditingController otp = TextEditingController();

  var id = ''.obs;

  getUserData() async{
    SharedPreferences saloon = await SharedPreferences.getInstance();
    id.value = saloon.getString("otpid").toString();
  }

  Future<void> otpContFun(otp, userId) async{
    try {
      loading(true);
      final newResponse = await ApiServices().otpVerification(otp, userId);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.snackbar("Login", oldResponse.value.message.toString());

        SharedPreferences saloon = await SharedPreferences.getInstance();
        saloon.setString('userToken', oldResponse.value.data!.token.toString());
        saloon.setString('userId', oldResponse.value.data!.userDetails!.id.toString());
        if(kDebugMode){
          print("userToken : ${saloon.getString("userToken")}");
          print("userId : ${saloon.getString("userId")}");
        }

        Get.to(()=> SaloonListScreen());

        print("OtpContFun called");
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("Login", oldResponse.value.message.toString());

        print("OtpContFun failed");
      }
    } on Exception catch (e) {
      loading(false);
    }finally{
      loading(false);
    }
  }
}