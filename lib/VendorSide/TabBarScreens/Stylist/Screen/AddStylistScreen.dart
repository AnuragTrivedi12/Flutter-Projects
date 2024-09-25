import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonTextFormField.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Controller/addStylistController.dart';

import '../../../Common/CommonColor.dart';
import '../../../Common/Common_TextStyle.dart';

class AddStylistScreen extends StatefulWidget {

  String ? saloonId;
  AddStylistScreen({required this.saloonId});

  @override
  State<AddStylistScreen> createState() => _AddStylistScreenState();
}

class _AddStylistScreenState extends State<AddStylistScreen> {

  AddStylistController controller = Get.put(AddStylistController());

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
        title: Text("Add Stylist",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.03,),
              Text("Add Stylist",style: CommonTextStyle.label_20_kavoon,),

              SizedBox(height: Get.height*0.03,),

              ///================== Stylist Name Field ================///
              Text("Name",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: controller.name,hinttext: "Stylist Name", readonly: false),

              SizedBox(height: Get.height*0.02,),

              ///================ Stylist Image Field =================///
              Text("Stylist Image",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(hinttext: "Attach File", readonly: true,
                suffixicon: InkWell(
                  onTap: () {
                    controller.selectImage();
                  },
                  child: Icon(CupertinoIcons.link)
                ),
              ),

              SizedBox(height: Get.height*0.01,),

              Obx(
                () {
                  return controller.images.isEmpty
                    ?
                  SizedBox()
                    :
                  SizedBox(
                    height: Get.height*0.22,
                    width: Get.width,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.images.length,
                      itemBuilder: (BuildContext context,int index) {
                        return Center(
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height*0.2,
                                width: Get.width*0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.purple,
                                  image: DecorationImage(image: FileImage(controller.images[index]),fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                left: Get.width*0.21,
                                top: Get.height*0.01,
                                child: InkWell(
                                  onTap: () {
                                    controller.images.removeAt(index);
                                  },
                                  child: Icon(Icons.cancel,size: 30,color: Colors.black,)
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context,int index) => SizedBox(width: Get.width*0.02,),
                    ),
                  );
                }
              ),

              ///================== Title Field ================///
              Text("Title",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height: Get.height*0.01,),
              CommonBlackTextFormField(controller: controller.title,hinttext: "Title", readonly: false),

              SizedBox(height: Get.height*0.02,),

              ///================== Working Hours Field =============///
              Text("Working Hours",style: CommonTextStyle.label_16_kavoon,),
              SizedBox(height:Get.height*0.01),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: Get.height*0.06,
                    width: Get.width*0.44,
                    child: TextFormField(
                      controller: controller.workingDate,
                      decoration: InputDecoration(
                        hintText: "Days: Mon-Sat",
                        hintStyle: CommonTextStyle.hintText_15_Mulish,
                        contentPadding: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: common_clr)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: common_clr)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: common_clr)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectTime(context);
                    },
                    child: Container(
                      height: Get.height*0.06,
                      width: Get.width*0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: common_clr),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(
                            () {
                              return Text(controller.workingHour.value.isEmpty ? "Time: " : controller.workingHour.value.toString(),style: CommonTextStyle.hintText_15_Mulish,);
                            }
                          ),
                          Icon(Icons.watch_later_outlined),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: Get.height*0.22,),

              Obx(
                () {
                  return controller.isLoading.value
                    ?
                  Center(child: CircularProgressIndicator(color: common_clr,),)
                    :
                  ContinueElevatedButton(onPressed: () {
                    controller.addStylistCont(widget.saloonId);
                  });
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
