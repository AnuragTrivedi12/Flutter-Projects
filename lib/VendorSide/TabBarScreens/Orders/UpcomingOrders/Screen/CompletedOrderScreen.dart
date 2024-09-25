import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonImage.dart';
import 'package:slider_button/slider_button.dart';

import '../../../../Common/CommonBoxDecoration.dart';
import '../../../../Common/CommonColor.dart';
import '../../../../Common/CommonText.dart';
import '../../../../Common/Common_TextStyle.dart';
import '../Controller/GetAllBookingsController.dart';

class CompletedOrderScreen extends StatefulWidget {
  const CompletedOrderScreen({super.key});

  @override
  State<CompletedOrderScreen> createState() => _CompletedOrderScreenState();
}

class _CompletedOrderScreenState extends State<CompletedOrderScreen> {

  GetAllBookingsController bookings_obj = Get.put(GetAllBookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height*0.11,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: common_clr,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: Obx(
        () {
          return bookings_obj.isLoading.value
              ?
          Center(child: CircularProgressIndicator(color: common_clr,),)
              :
          bookings_obj.allBookings.length == 0
              ?
          Center(child: Text("No Bookings Found!"),)
              :
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height*0.03,),

                Text("Completed Order",style: CommonTextStyle.label_20_kavoon,),

                SizedBox(height: Get.height*0.02,),

                Container(
                  width: Get.width,
                  decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              // backgroundColor: common_clr,
                              backgroundImage: AssetImage(common_img),
                            ),

                            SizedBox(width: Get.width*0.02,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(common_name,style: CommonTextStyle.label_20_kavoon,),
                                Container(
                                    width: Get.width*0.5,
                                    child: Text("Bodakdev Ahmedabad 380054",style: CommonTextStyle.mulish_18_w300,)
                                ),
                              ],
                            ),

                            Spacer(),

                            Text("Paid",style: TextStyle(fontFamily: "Kavoon",fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF36A900)),)
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.015,),
                      Container(
                        height:Get.height*0.001,
                        width: Get.width,
                        color: Color(0xFFF2F2F2),
                      ),

                      SizedBox(height: Get.height*0.01,),

                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Services",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Haircut",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Wednesday, January 10 ",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Time",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("02:00 PM",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Get.height*0.015,),
                      Container(
                        height:Get.height*0.001,
                        width: Get.width,
                        color: Color(0xFFF2F2F2),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Collected Amount",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("\$03.00",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Payment Mode",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Online",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: Get.height*0.025,),

                Container(
                  width: Get.width,
                  decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              // backgroundColor: common_clr,
                              backgroundImage: AssetImage(common_img),
                            ),

                            SizedBox(width: Get.width*0.02,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(common_name,style: CommonTextStyle.label_20_kavoon,),
                                Container(
                                    width: Get.width*0.5,
                                    child: Text("Bodakdev Ahmedabad 380054",style: CommonTextStyle.mulish_18_w300,)
                                ),
                              ],
                            ),

                            Spacer(),

                            Text("Unpaid",style: CommonTextStyle.kavoon_14_w400_customclr(Color(0xFFF90303)),)
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.015,),
                      Container(
                        height:Get.height*0.001,
                        width: Get.width,
                        color: Color(0xFFF2F2F2),
                      ),

                      SizedBox(height: Get.height*0.01,),

                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Services",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Haircut",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Wednesday, January 10 ",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Time",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("02:00 PM",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Get.height*0.015,),
                      Container(
                        height:Get.height*0.001,
                        width: Get.width,
                        color: Color(0xFFF2F2F2),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Collected Amount",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("\$03.00",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Payment Mode",style: CommonTextStyle.label_16_kavoon_400,),
                                Text("Online",style: CommonTextStyle.mulish_15_w300,),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
