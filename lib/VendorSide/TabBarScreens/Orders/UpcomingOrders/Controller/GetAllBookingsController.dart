import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Orders/UpcomingOrders/Model/GetAllBookingModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllBookingsController extends GetxController{

  RxBool isLoading = false.obs;
  var oldResponse = GetAllBookingModel().obs;

  List allBookings = [];

  Future<void> getAllBookingContFun(saloonId) async{

    try {
      isLoading(true);
      final newResponse = await ApiServices().getAllBookingbySaloon(saloonId);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;

        allBookings.clear();
        oldResponse.value.data!.forEach((element) {
          allBookings.add(element);
        });

        // SharedPreferences saloon = await SharedPreferences.getInstance();
        // var saloon_id = saloon.getString("saloon_id");
        // if(kDebugMode){
        //   print("Saloon Id : $saloon_id");
        // }

        print("Get All Bookings Cont Fun Called");
      }else{
        oldResponse = newResponse.obs;
      }
    } on Exception catch (e) {
      isLoading(false);
    }finally{
      isLoading(false);
    }
  }
}