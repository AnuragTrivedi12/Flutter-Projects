import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonBoxDecoration.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_SharedPreferences.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Service/Controller/getAllSaloonServicesController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Service/Screen/AddServiceScreen.dart';

class ServiceListScreen extends StatefulWidget {

  String ? saloonId;
  ServiceListScreen({required this.saloonId});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {

  GetAllSaloonServicesController controller_obj = Get.put(GetAllSaloonServicesController());

  Future<void> controllerCallingFun() async{
    await controller_obj.getAllServicesContFun();
  }

  @override
  void initState() {
    super.initState();
    controllerCallingFun();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(height: Get.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonElevatedButton(onPressed: () {
                Get.to(()=> AddServiceScreen());
              }),
            ],
          ),

          SizedBox(height: Get.height*0.04,),

          Expanded(
            child: Obx(
              () {
                return controller_obj.isLoading.value
                    ?
                Center(child: CircularProgressIndicator(color: common_clr,),)
                    :
                controller_obj.oldResponse.value.data!.length == 0
                    ?
                Center(child: SizedBox(child: Text("No Data Found!")),)
                    :
                Container(
                  height: Get.height,
                  width: Get.width,
                  padding: EdgeInsets.only(top: 10.0),
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    itemCount: controller_obj.oldResponse.value.data!.length,
                    itemBuilder: (BuildContext context,int index) {
                      var user = controller_obj.oldResponse.value.data![index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                        child: Container(
                          height: Get.height*0.14,
                          width: Get.width*0.9,
                          decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  height: Get.height*0.09,
                                  width: Get.width*0.18,
                                  imageUrl: user.imagePaths!.length != 0 ? user.imagePaths![0].toString() : "https://www.cutchimemonbangalore.com/assets/images/blank.png",
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFBB03B).withOpacity(0.3),
                                      image: DecorationImage(
                                        image: imageProvider , scale: 3.0
                                      )
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: common_clr,),),
                                ),
                                SizedBox(width: Get.width*0.03,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: Get.height*0.01,),
                                    SizedBox(
                                      width: Get.width*0.6,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(user.name.toString(),style: CommonTextStyle.mulish_20_w700(Colors.black),),
                                          // SizedBox(width: Get.width*0.28,),
                                          Text(user.price.toString(),style: CommonTextStyle.mulish_16_w700(Colors.black),),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: Get.height*0.002,),
                                    SizedBox(
                                      width: Get.width*0.6,
                                      // color: Colors.blue,
                                      child: Text(user.description.toString())),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: Get.height*0.002,),
                  ),
                );
              }
            ),
          ),


          // Container(
          //   height: Get.height*0.16,
          //   width: Get.width*0.9,
          //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: Get.height*0.09,
          //           width: Get.width*0.18,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(image: AssetImage("assets/images/hair_cut_tool.png"),scale:3.0),
          //             color: Color(0xFFFBB03B).withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //         ),
          //         SizedBox(width: Get.width*0.03,),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: Get.height*0.01,),
          //             Row(
          //               children: [
          //                 Text("Hair Cut",style: CommonTextStyle.mulish_20_w700(Colors.black),),
          //                 SizedBox(width: Get.width*0.32,),
          //                 Text("\$03.00",style: CommonTextStyle.mulish_16_w700(Colors.black),),
          //               ],
          //             ),
          //             SizedBox(height: Get.height*0.002,),
          //             Container(
          //               width: Get.width*0.64,
          //               // color: Colors.blue,
          //               child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: Get.height*0.02,),
          //
          // Container(
          //   height: Get.height*0.16,
          //   width: Get.width*0.9,
          //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: Get.height*0.09,
          //           width: Get.width*0.18,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(image: AssetImage("assets/images/hair_color.png"),scale:3.0),
          //             color: Color(0xFF91E04C).withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //         ),
          //         SizedBox(width: Get.width*0.03,),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: Get.height*0.01,),
          //             Row(
          //               children: [
          //                 Text("Hair Color",style: CommonTextStyle.mulish_20_w700(Colors.black),),
          //                 SizedBox(width: Get.width*0.28,),
          //                 Text("\$03.00",style: CommonTextStyle.mulish_16_w700(Colors.black),),
          //               ],
          //             ),
          //             SizedBox(height: Get.height*0.002,),
          //             Container(
          //                 width: Get.width*0.64,
          //                 // color: Colors.blue,
          //                 child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: Get.height*0.02,),
          //
          // Container(
          //   height: Get.height*0.16,
          //   width: Get.width*0.9,
          //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: Get.height*0.09,
          //           width: Get.width*0.18,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(image: AssetImage("assets/images/cosmetics.png"),scale:3.0),
          //             color: Color(0xFF00AFD8).withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //         ),
          //         SizedBox(width: Get.width*0.03,),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: Get.height*0.01,),
          //             Row(
          //               children: [
          //                 Text("Make Up",style: CommonTextStyle.mulish_20_w700(Colors.black),),
          //                 SizedBox(width: Get.width*0.3,),
          //                 Text("\$03.00",style: CommonTextStyle.mulish_16_w700(Colors.black),),
          //               ],
          //             ),
          //             SizedBox(height: Get.height*0.002,),
          //             Container(
          //                 width: Get.width*0.64,
          //                 // color: Colors.blue,
          //                 child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: Get.height*0.02,),
          //
          // Container(
          //   height: Get.height*0.16,
          //   width: Get.width*0.9,
          //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           height: Get.height*0.09,
          //           width: Get.width*0.18,
          //           decoration: BoxDecoration(
          //             image: DecorationImage(image: AssetImage("assets/images/hair_treatment.png"),scale:3.0),
          //             color: Color(0xFF7065E4).withOpacity(0.3),
          //             borderRadius: BorderRadius.circular(15),
          //           ),
          //         ),
          //         SizedBox(width: Get.width*0.03,),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(height: Get.height*0.01,),
          //             Row(
          //               children: [
          //                 Text("Hair Spa",style: CommonTextStyle.mulish_20_w700(Colors.black),),
          //                 SizedBox(width: Get.width*0.32,),
          //                 Text("\$03.00",style: CommonTextStyle.mulish_16_w700(Colors.black),),
          //               ],
          //             ),
          //             SizedBox(height: Get.height*0.002,),
          //             Container(
          //                 width: Get.width*0.64,
          //                 // color: Colors.blue,
          //                 child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //
          // SizedBox(height: Get.height*0.1,),
          //
          // ContinueElevatedButton(onPressed: () {}),
          //
          // SizedBox(height: Get.height*0.02,),
        ],
      ),
    );
  }
}
