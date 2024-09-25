import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Model/GetSaloonModel.dart';

class GetSaloonController extends GetxController{
  var loading = false.obs;
  var oldResponse = GetSaloonModel().obs;
  var saloonId = "".obs;

  void setSaloonId(String id){
    saloonId.value = id.toString();
  }

  List allSaloons = [];

  Future<void> getSaloonListCont() async{
    try {
      loading(true);
      final newResponse = await ApiServices().getSaloon();
      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
        
        allSaloons.clear();
        oldResponse.value.data!.forEach((element) {
          allSaloons.add(element);
        });

        // SharedPreferences saloon = await SharedPreferences.getInstance();
        // oldResponse.value.data!.forEach((element) {
        //   saloon.setStringList("saloon_id", element.id.toString() as List<String>);
        // });
        // print(saloon.getStringList('key'))
        // saloon.setStringList(key, value)

        print("Get Saloon List Cont Called");
      }else{
        oldResponse = newResponse.obs;
        Get.snackbar("", oldResponse.value.message.toString());
      }
    } on Exception catch (e) {
      loading(false);
    }finally{
      loading(false);
    }
  }

  @override
  void onInit() {
    getSaloonListCont();
    super.onInit();
  }
}