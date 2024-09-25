import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonTextFormField.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/AddSaloonController.dart';
import '../../Common/CommonColor.dart';
import '../../Common/CommonElevatedButton.dart';
import '../../Common/Common_TextStyle.dart';

class AddSaloonScreen extends StatefulWidget {
  const AddSaloonScreen({super.key});

  @override
  State<AddSaloonScreen> createState() => _AddSaloonScreenState();
}

class _AddSaloonScreenState extends State<AddSaloonScreen> {

  // var addSaloon = Get.find<AddSaloonController>();
  final AddSaloonController addSaloon_obj = Get.put(AddSaloonController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.11,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left,size: 30,color: Colors.white,)
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: common_clr,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text("Add Saloons",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.025,),
              Text("Add Saloon",style: CommonTextStyle.label_20_kavoon,),

              SizedBox(height: Get.height*0.04,),

              ///================== Saloon Name Field =================///
              Text("Saloon Name",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: addSaloon_obj.name,hinttext: "Saloon Name", readonly: false),
              SizedBox(height: Get.height*0.02,),

              ///================== Saloon Image Field =================///
              Text("Saloon Image",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Saloon Image", readonly: true,
                suffixicon: InkWell(
                  onTap: () {
                    addSaloon_obj.selectImages();
                  },
                  child: Icon(CupertinoIcons.link)
                ),
              ),
              SizedBox(height: Get.height*0.01,),

              Obx(() {
                return addSaloon_obj.images.isEmpty
                  ?
                SizedBox()
                  :
                SizedBox(
                  height: Get.height*0.22,
                  width: Get.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: addSaloon_obj.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Stack(
                          children: [
                            Container(
                              height: Get.height*0.2,
                              width: Get.width*0.3,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(image: FileImage(addSaloon_obj.images[index]),fit: BoxFit.fill),
                              ),
                            ),
                            Positioned(
                              left: Get.width*0.21,
                              top: Get.height*0.01,
                              child: InkWell(
                                onTap: () {
                                  addSaloon_obj.images.removeAt(index);
                                },
                                child: Icon(
                                  Icons.cancel,size: 30,color: Colors.black,
                                ),
                              )
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: Get.width*0.02,);
                    },
                  ),
                );
              }
              ),

              SizedBox(height: Get.height*0.02,),

              ///================== Description Field =================///
              Text("Description",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: addSaloon_obj.description,hinttext: "Description...", readonly: false),
              SizedBox(height: Get.height*0.02,),

              ///================== Opening Days & Hours Field ===============///
              // Text("Opening Days & Hours",style: CommonTextStyle.label_16_kavoon,),
              // SizedBox(height: Get.height*0.01,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //         Container(
              //           height: Get.height*0.055,
              //           width: Get.width*0.4,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(18),
              //             border:Border.all(
              //               color: Color(0xFF9A8F8F),
              //             ),
              //           ),
              //           child: Text("Starting Days",style: CommonTextStyle.hintText_15_Mulish,),
              //         ),
              //
              //         SizedBox(height: Get.height*0.02,),
              //
              //         Container(
              //           height: Get.height*0.055,
              //           width: Get.width*0.4,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(18),
              //             border:Border.all(
              //               color: Color(0xFF9A8F8F),
              //             ),
              //           ),
              //           child: Text("Starting Days",style: CommonTextStyle.hintText_15_Mulish,),
              //         ),
              //       ],
              //     ),
              //
              //     SizedBox(width: Get.width*0.055,),
              //
              //     Column(
              //       children: [
              //         Container(
              //           height: Get.height*0.055,
              //           width: Get.width*0.4,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(18),
              //             border:Border.all(
              //               color: Color(0xFF9A8F8F),
              //             ),
              //           ),
              //           child: Text("Starting Days",style: CommonTextStyle.hintText_15_Mulish,),
              //         ),
              //
              //         SizedBox(height: Get.height*0.02,),
              //
              //         Container(
              //           height: Get.height*0.055,
              //           width: Get.width*0.4,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(18),
              //             border:Border.all(
              //               color: Color(0xFF9A8F8F),
              //             ),
              //           ),
              //           child: Text("Starting Days",style: CommonTextStyle.hintText_15_Mulish,),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),

              // SizedBox(height: Get.height*0.02,),

              ///================== Address Field ===============///

              Text("Address",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: addSaloon_obj.address,hinttext: "Address", readonly: false),
              SizedBox(height: Get.height*0.02,),

              ///================== Pincode Field ===============///

              Text("Pincode",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: addSaloon_obj.pincode,hinttext: "Pincode", readonly: false),
              SizedBox(height: Get.height*0.02,),

              ///================== Phone Number Field ===============///

              Text("Phone Number",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: addSaloon_obj.mobile,hinttext: "Phone Number", readonly: false),


              SizedBox(height: Get.height*0.07,),

              Obx(
                () {
                  return addSaloon_obj.isLoading.value
                      ?
                  Center(child: CircularProgressIndicator(color: common_clr,),)
                      :
                  ContinueElevatedButton(onPressed: () {
                    addSaloon_obj.addSaloonContFun();
                    // Get.to(()=> ChooseServiceScreen(saloon_id: '',));
                  });
                }
              ),

              SizedBox(height: Get.height*0.02,),

            ],
          ),
        ),
      ),
    );
  }
}
