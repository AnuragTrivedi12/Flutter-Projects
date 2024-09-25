import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Orders/UpcomingOrders/Model/OrderUpdateModel.dart';

class OrderUpdateController extends GetxController{
  RxBool isLoading1 = false.obs;
  RxBool isLoading2 = false.obs;
  var oldResponse = OrderUpdateModel().obs;

  String ? appoinmentId;
  String ? OrderStatus;

  Future<void> orderUpdateCont1(appointmentId, orderStatus) async{
    try {
      isLoading1(true);
      final newResponse = await ApiServices().orderUpdate(appointmentId, orderStatus);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
      }
    } on Exception catch (e) {
      print("Error: $e");
      isLoading1(false);
    }finally{
      isLoading1(false);
    }
  }

  Future<void> orderUpdateCont2(appointmentId, orderStatus) async{
    try {
      isLoading2(true);

      final newResponse = await ApiServices().orderUpdate(appointmentId, orderStatus);

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
      }
    } on Exception catch (e) {
      isLoading2(false);
    }finally{
      isLoading2(false);
    }
  }
}