import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/ApiServices/ApiServices.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/GetSaloonController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Model/AddStylistModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddStylistController extends GetxController{
  RxBool isLoading = false.obs;
  var oldResponse = AddStylistModel().obs;
  var name = TextEditingController();
  var title = TextEditingController();
  var workingHour = "".obs;
  var images = [].obs;
  final ImagePicker imagePicker = ImagePicker();
  var workingDate = TextEditingController();
  GetSaloonController getAllSaloons = Get.put(GetSaloonController());

  Future<void> selectTime(BuildContext context) async{
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );

    if(pickedTime != null){
      final DateTime now = DateTime.now();
      final DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      final String formattedTime = DateFormat('hh:mm a').format(selectedDateTime);
      workingHour.value = formattedTime;
    }else{
      print("Time is not selected");
    }
  }

  void selectImage() async{
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (var xFile in selectedImages) {
        var file = File(xFile.path);
        images.add(file);
      }
    }
    print("Images Length: "+ images.length.toString());
  }

  Future<void> addStylistCont(saloonId) async{
    try {
      isLoading(true);
      final newResponse = await ApiServices().addStylist(saloonId.toString(), name.text, title.text, workingDate.text, workingHour.value.toString(), images);
      if(newResponse.responseCode == 1){
        oldResponse = newResponse.obs;
        Get.back();
        print("Add Stylist Cont Fun Called");
        Fluttertoast.showToast(msg: oldResponse.value.message.toString());
      }else{
        isLoading(false);
        oldResponse = newResponse.obs;
        print("Add Stylist Cont Fun Failed");
      }
    } finally {
      isLoading(false);
    }
  }
}