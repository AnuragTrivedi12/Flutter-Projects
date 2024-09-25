import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/LoginModel.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Model/RegisterModel.dart';
import 'package:hair_beauty_salon/VendorSide/auth/Screen/otpScreen.dart';

class RegisterController extends GetxController{

  var loading = false.obs;
  var oldResponse = RegisterModel().obs;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNum = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController address = TextEditingController();

  Future<void> registerContFun(First_Name,Last_Name,Mobile_Number,Email,Gender,Birth_Date,Pincode,Address) async{
    try {
      loading(true);

      final newResponse = await ApiServices().register(First_Name, Last_Name, Mobile_Number, Email, Gender, Birth_Date, Pincode, Address);

      if(newResponse.success == true ){
        oldResponse = newResponse.obs;
        Get.snackbar("Regiser", oldResponse.value.message.toString());

        print("registercont called");
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("Register", oldResponse.value.message.toString());

        print("registercont failed");
      }
    } on Exception catch (e) {
      loading(false);
    }finally{
      loading(false);
    }
  }
}
