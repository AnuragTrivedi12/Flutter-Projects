import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Screen/saloonListScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/AddSaloonServiceModel.dart';

class AddSaloonServiceController extends GetxController{

  RxBool isLoading = false.obs;
  var oldResponse = AddSaloonServiceModel().obs;

  TextEditingController service = TextEditingController();

  Future<void> addServiceContFun(saloonId, service) async{
    try {
      isLoading(true);
      final newResponse = await ApiServices().addSaloonService(saloonId, service);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;

        SharedPreferences saloon = await SharedPreferences.getInstance();
        saloon.setString("saloon_id", oldResponse.value.data!.id.toString());


        Get.to(()=> SaloonListScreen());
        print("Add Saloon Service Cont Fun Called");
      }else{
        oldResponse = newResponse.obs;

        print("Add Saloon Service Cont Fun failed");
      }
    } on Exception catch (e) {
      isLoading(false);
    }finally{
      isLoading(false);
    }
  }
}