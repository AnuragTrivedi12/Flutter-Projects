import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Service/Model/GetAllSaloonServicesModel.dart';
import '../../../Saloon/Controller/GetSaloonController.dart';

class GetAllSaloonServicesController extends GetxController{
  RxBool isLoading = false.obs;
  var oldResponse = GetAllSaloonServicesModel().obs;
  GetSaloonController getAllSaloons = Get.put(GetSaloonController());

  Future<void> getAllServicesContFun() async{
    try {
      isLoading(true);
      final newResponse = await ApiServices().getAllServices(getAllSaloons.saloonId.value.toString());
      if (kDebugMode) {
        print("Saloon id: ${getAllSaloons.saloonId.value.toString()}");
      }

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Fluttertoast.showToast(msg: oldResponse.value.message.toString());
        print("Cont Fun Called");
      }else{
        oldResponse = newResponse.obs;
        print("Cont Fun Failed");
      }
    } on Exception catch (e) {
      print("Error: $e");
      isLoading(false);
    }finally{
      isLoading(false);
    }
  }
}