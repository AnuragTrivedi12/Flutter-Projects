import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/GetSaloonController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Model/GetAllStylistModel.dart';

class GetAllStylistController extends GetxController{
  RxBool isLoading = false.obs;
  var oldResponse = GetAllStylistModel().obs;
  GetSaloonController getAllSaloons = Get.put(GetSaloonController());
  List stylists = [];

  Future<void> getAllStylistCont(saloonId) async{
    try {
      isLoading(true);
      final newResponse = await ApiServices().getAllStylist(saloonId);
      if (kDebugMode) {
        print("Saloon id: ${getAllSaloons.saloonId.value.toString()}");
      }

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        stylists.clear();
        oldResponse.value.data!.forEach((element) {
          stylists.add(element);
        });
        Fluttertoast.showToast(msg: oldResponse.value.message.toString());
        print("Cont Fun Called");
      }else{
        oldResponse = newResponse.obs;
        print("Cont Fun Failed");

      }
    }on Exception catch(e){
      isLoading(false);
      if (kDebugMode) {
        print("Error: $e");
      }
    }
    finally {
      isLoading(false);
    }
  }
}