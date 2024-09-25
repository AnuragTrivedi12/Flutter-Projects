import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonBoxDecoration.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/GetSaloonController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Controller/getAllStylistController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Stylist/Screen/AddStylistScreen.dart';
import '../../../Common/CommonElevatedButton.dart';

class StylistListScreen extends StatefulWidget {

  String ? saloonId;
  StylistListScreen({super.key, required this.saloonId});

  @override
  State<StylistListScreen> createState() => _StylistListScreenState();
}

class _StylistListScreenState extends State<StylistListScreen> {
  // const StylistListScreen({super.key});
  GetAllStylistController controller = Get.put(GetAllStylistController());
  GetSaloonController allSaloon_obj = Get.put(GetSaloonController());

  Future<void> controllerCallingFun() async{
    await controller.getAllStylistCont(widget.saloonId);
  }

  @override
  void initState() {
    super.initState();
    print("SaloonID : ${allSaloon_obj.saloonId.toString()}");
    controllerCallingFun();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          SizedBox(height: Get.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonElevatedButton(onPressed: () {
                Get.to(()=>AddStylistScreen(saloonId: widget.saloonId,));
              }),
            ],
          ),

          SizedBox(height: Get.height*0.03,),

          Expanded(
            child: Obx(
              () {
                return controller.isLoading.value
                  ?
                Center(child: CircularProgressIndicator(color: common_clr,),)
                  :
                controller.stylists.length == 0
                  ?
                Center(child: Text("No Stylists Found!"),)
                  :
                SizedBox(
                  width: Get.width,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.stylists.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = controller.oldResponse.value.data![index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                        child: Container(
                          width: Get.width*0.8,
                          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                          decoration: CommonBoxDecoration.roundCornder_shadowBox,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(CupertinoIcons.pencil),
                                  Icon(CupertinoIcons.trash_fill)
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    height: Get.height*0.1,
                                    width: Get.width*0.1,
                                    imageUrl: user.imagePaths!.length != 0 ? user.imagePaths![0].toString() : "https://www.cutchimemonbangalore.com/assets/images/blank.png",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: imageProvider)
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: common_clr,),),
                                  ),

                                  SizedBox(width: Get.width*0.035,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(user.name.toString(),style: CommonTextStyle.label_20_kavoon,),
                                      Text(user.title.toString(),style: CommonTextStyle.mulish_15_w700.copyWith(color: Color(0xFF666565)),),
                                    ],
                                  )
                                ],
                              ),

                              SizedBox(height: Get.height*0.02,),

                              Text("Working Hours",style: CommonTextStyle.label_16_kavoon,),
                              SizedBox(height: Get.height*0.01,),

                              Row(
                                children: [
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Color(0xFF9A8F8F)
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Days:  ${user.workingDate.toString()}",style: CommonTextStyle.mulish_10_w300,),
                                        SizedBox(width: Get.width*0.02,),
                                        Icon(Icons.calendar_month,color: Color(0xFF9A8F8F),size: 20,),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: Get.width*0.055,),

                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Color(0xFF9A8F8F)
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Hours:  ${user.workingHour.toString()}",style: CommonTextStyle.mulish_10_w300,),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context,int index) => SizedBox(height: Get.height*0.01,),
                  ),
                );
              }
            ),
          ),

          SizedBox(height: Get.height*0.03,),

          ContinueElevatedButton(onPressed: () {}),

          SizedBox(height: Get.height*0.035,)
        ],
      ),
    );
  }
}
