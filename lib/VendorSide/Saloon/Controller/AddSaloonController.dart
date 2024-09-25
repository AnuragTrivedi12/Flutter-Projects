import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Model/AddSaloonModel.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Screen/chooseService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddSaloonController extends GetxController{
  RxBool isLoading = false.obs;
  var oldResponse = AddSaloonModel().obs;

  TextEditingController name = TextEditingController();
  var images = [].obs;
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  var generatedSaloonId = ''.obs;

  String? startingDay;
  String? endingDay;
  var startingHour = TextEditingController();
  var endingHour = TextEditingController();

  void selectImages() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if(selectedImages != null && selectedImages.isNotEmpty){
      for(var xFile in selectedImages){
        var file =  File(xFile.path);
        images.add(file);
      }
    }
    print("Images List Length" + images.length.toString());
  }

  String id = "";

   getUserData() async{
    SharedPreferences saloon = await SharedPreferences.getInstance();
    id = saloon.getString("userId").toString();
   }

  Future<void> addSaloonContFun() async{
    try {
      getUserData();
      isLoading(true);
      final newResponse = await ApiServices().addSaloon(
        id.toString(),
        name.text,
        images,
        description.text,
        address.text,
        pincode.text,
        mobile.text
      );

      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;

        SharedPreferences saloon = await SharedPreferences.getInstance();
        generatedSaloonId.value = oldResponse.value.data!.id.toString();
        saloon.setString("saloon_id", oldResponse.value.data!.id.toString());


        Get.to(()=> ChooseServiceScreen(saloon_id: oldResponse.value.data!.id.toString()));

        print("Add Saloon Cont Fun Called");
      }else{
        oldResponse = newResponse.obs;
        print("Add Saloon Cont Fun Failed");
      }
    } on Exception catch (e) {
      isLoading(false);
    }finally{
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}