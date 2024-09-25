import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonBoxDecoration.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/GetSaloonController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Orders/UpcomingOrders/Controller/GetAllBookingsController.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Orders/UpcomingOrders/Controller/OrderUpdateController.dart';

class UpcomingOrderScreen extends StatefulWidget {
  String ? saloonId;
  UpcomingOrderScreen({super.key,required this.saloonId});

  @override
  State<UpcomingOrderScreen> createState() => _UpcomingOrderScreenState();
}

class _UpcomingOrderScreenState extends State<UpcomingOrderScreen> {

  GetAllBookingsController bookings_obj = Get.put(GetAllBookingsController());
  OrderUpdateController orderUpdate_obj = Get.put(OrderUpdateController());
  GetSaloonController getAllSaloon_obj = Get.put(GetSaloonController());

  Future<void> controllerCallingFun() async{
    await bookings_obj.getAllBookingContFun(widget.saloonId);
  }

  int selectedIndex = 0;
  int selectedIndexx = 0;

  @override
  void initState() {
    super.initState();
    print("SaloonId: ${getAllSaloon_obj.saloonId.toString()}");
    controllerCallingFun();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return bookings_obj.isLoading.value
          ?
        Center(child: CircularProgressIndicator(color: Colors.black,),)
          :
        bookings_obj.allBookings.length == 0
          ?
        Center(child: Text("No Bookings Found!"))
          :
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height*0.055,),

              Expanded(
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: ListView.separated(
                    itemCount: bookings_obj.allBookings.length,
                    itemBuilder: (context, index) {
                      var booking = bookings_obj.oldResponse.value.data![index];
                      // var service = booking.services![index].name;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(height: Get.height*0.025,),
                              Row(
                                children: [
                                  SizedBox(width: Get.width*0.03,),
                                  CachedNetworkImage(
                                    height: Get.height*0.15,
                                    width: Get.width*0.15,
                                    imageUrl: booking.stylistImage != 0
                                      ?
                                    booking.stylistImage![0].toString()
                                      :
                                    "https://res.cloudinary.com/dtwqzd4sz/image/upload/v1706524546/dglbnfwykn4sk587bvor.png",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: common_clr,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: Get.width*0.03,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${booking.userName}",style: CommonTextStyle.label_20_kavoon,),
                                      Container(
                                          width: Get.width*0.5,
                                          child: Text("${booking.saloonAddress}",style: CommonTextStyle.mulish_18_w300,)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height*0.005,),
                              Container(
                                height:Get.height*0.001,
                                width: Get.width,
                                color: Color(0xFFF2F2F2),
                              ),

                              SizedBox(height: Get.height*0.01,),

                              Padding(
                                padding:EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Services",style: CommonTextStyle.label_16_kavoon_400,),
                                        Container(
                                          width: Get.width*0.200,
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                              itemBuilder: (context, indexx) {
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${bookings_obj.oldResponse.value.data![index].services![indexx].name}", style: TextStyle(color: Colors.black),overflow: TextOverflow.ellipsis,)
                                                  ],
                                                );
                                              },
                                              separatorBuilder: (context, indexx) => SizedBox(height: Get.height*0.001,),
                                              itemCount: bookings_obj.oldResponse.value.data![index].services!.length
                                          ),
                                        )
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Date",style: CommonTextStyle.label_16_kavoon_400,),
                                        Text("${booking.date}",style: CommonTextStyle.mulish_15_w300,),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Time",style: CommonTextStyle.label_16_kavoon_400,),
                                        Text("${booking.timeSlot}",style: CommonTextStyle.mulish_15_w300,),
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
                                padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        selectedIndex = index;

                                        setState(() {
                                          orderUpdate_obj.appoinmentId = bookings_obj.oldResponse.value.data![index].id.toString();
                                          if (kDebugMode) {
                                            print("Appointment Id: ${orderUpdate_obj.appoinmentId}");
                                          }
                                          orderUpdate_obj.orderUpdateCont1(orderUpdate_obj.appoinmentId.toString(), '1').then((value) {
                                            if(orderUpdate_obj.oldResponse.value.responseCode == 1){
                                              bookings_obj.getAllBookingContFun(booking.saloonId.toString());
                                            }
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: Get.height*0.06,
                                        width: Get.width*0.4,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: common_clr,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: orderUpdate_obj.isLoading1.value
                                          ?
                                          selectedIndex == index ? Center(child: CircularProgressIndicator(color: Colors.white,),)
                                          :
                                          Text(bookings_obj.oldResponse.value.data![index].orderStatus.toString() == '0' ? 'Accept Order' : bookings_obj.oldResponse.value.data![index].orderStatus.toString() == '1' ? 'Order Accepted' : 'Order Cancelled',style: CommonTextStyle.mulish_16_w700(Colors.white),)
                                          :
                                          Text(bookings_obj.oldResponse.value.data![index].orderStatus.toString() == '0' ? 'Accept Order' : bookings_obj.oldResponse.value.data![index].orderStatus.toString() == '1' ? 'Order Accepted' : 'Order Cancelled',style: CommonTextStyle.mulish_16_w700(Colors.white),)

                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        orderUpdate_obj.appoinmentId = bookings_obj.oldResponse.value.data![index].id.toString();
                                        print("Appointment Id: ${orderUpdate_obj.appoinmentId}");
                                        orderUpdate_obj.orderUpdateCont2(orderUpdate_obj.appoinmentId.toString(), '2').then((value) {
                                          if(orderUpdate_obj.oldResponse.value.responseCode == 1){
                                            bookings_obj.getAllBookingContFun(booking.saloonId.toString());
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: Get.height*0.06,
                                        width: Get.width*0.4,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: common_clr
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: orderUpdate_obj.isLoading2.value
                                          ?
                                          selectedIndexx == index ? Center(child: CircularProgressIndicator(color: common_clr,),)
                                          :
                                          Text("Cancel",style: CommonTextStyle.mulish_16_w700(common_clr),)
                                          :
                                          Text("Cancel",style: CommonTextStyle.mulish_16_w700(common_clr),),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: Get.height*0.02,),
                  ),
                ),
              )

              // Container(
              //   width: Get.width*0.9,
              //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
              //   child: Column(
              //     children: [
              //       SizedBox(height: Get.height*0.025,),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           SizedBox(width: Get.width*0.03,),
              //           CircleAvatar(
              //             maxRadius: 30,
              //             // backgroundColor: common_clr,
              //             backgroundImage: AssetImage(common_img),
              //           ),
              //
              //           SizedBox(width: Get.width*0.02,),
              //
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(common_name,style: CommonTextStyle.label_20_kavoon,),
              //               Container(
              //                 width: Get.width*0.5,
              //                 child: Text("Bodakdev Ahmedabad 380054",style: CommonTextStyle.mulish_18_w300,)
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: Get.height*0.015,),
              //       Container(
              //         height:Get.height*0.001,
              //         width: Get.width,
              //         color: Color(0xFFF2F2F2),
              //       ),
              //
              //       SizedBox(height: Get.height*0.01,),
              //
              //       Padding(
              //         padding:EdgeInsets.symmetric(horizontal: 8.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Services",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("Haircut",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Date",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("Wednesday, January 10 ",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Time",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("02:00 PM",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //       SizedBox(height: Get.height*0.015,),
              //       Container(
              //         height:Get.height*0.001,
              //         width: Get.width,
              //         color: Color(0xFFF2F2F2),
              //       ),
              //
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 13.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             SliderButton(
              //               action: () async{},
              //               label: Text("Accept Order",style: CommonTextStyle.label_14_kavoon_400_white,),
              //               alignLabel: Alignment.center,
              //               backgroundColor: common_clr,
              //               buttonColor: Color(0xFFDDB668),
              //               shimmer: false,
              //               height: Get.height*0.07,
              //               width: Get.width*0.6,
              //               icon: Icon(CupertinoIcons.chevron_right_2,color: Colors.white,),
              //             ),
              //
              //             InkWell(
              //               onTap: () {},
              //               child: Container(
              //                 height: Get.height*0.12,
              //                 width: Get.width*0.12,
              //                 alignment: Alignment.center,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: Colors.red,
              //                 ),
              //                 child: Icon(Icons.block,color: Colors.white,),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),

              // SizedBox(height: Get.height*0.02,),

              // Container(
              //   width: Get.width*0.9,
              //   // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              //   decoration: CommonBoxDecoration.roundCornder_shadowBox_20,
              //   child: Column(
              //     children: [
              //       SizedBox(height: Get.height*0.025,),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           SizedBox(width: Get.width*0.03,),
              //           CircleAvatar(
              //             maxRadius: 30,
              //             // backgroundColor: common_clr,
              //             backgroundImage: AssetImage(common_img),
              //           ),
              //
              //           SizedBox(width: Get.width*0.02,),
              //
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(common_name,style: CommonTextStyle.label_20_kavoon,),
              //               Container(
              //                 width: Get.width*0.5,
              //                 child: Text("Bodakdev Ahmedabad 380054",style: CommonTextStyle.mulish_18_w300,)
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: Get.height*0.015,),
              //       Container(
              //         height:Get.height*0.001,
              //         width: Get.width,
              //         color: Color(0xFFF2F2F2),
              //       ),
              //
              //       SizedBox(height: Get.height*0.01,),
              //
              //       Padding(
              //         padding:EdgeInsets.symmetric(horizontal: 8.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Services",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("Haircut",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Date",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("Wednesday, January 10 ",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Time",style: CommonTextStyle.label_16_kavoon_400,),
              //                 Text("02:00 PM",style: CommonTextStyle.mulish_15_w300,),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //       SizedBox(height: Get.height*0.015,),
              //       Container(
              //         height:Get.height*0.001,
              //         width: Get.width,
              //         color: Color(0xFFF2F2F2),
              //       ),
              //
              //       Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 13.0,vertical: 15.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             ElevatedButton(
              //               onPressed: () {
              //                 Get.to(()=> CompletedOrderScreen());
              //               },
              //               style: ElevatedButton.styleFrom(
              //                 minimumSize: Size(160, 50),
              //                 backgroundColor: Color(0xFF36A900),
              //               ),
              //               child: Text("Completed",style: CommonTextStyle.label_14_kavoon_400_white,),
              //             ),
              //
              //             ElevatedButton(
              //               onPressed: () {},
              //               style: ElevatedButton.styleFrom(
              //                 minimumSize: Size(160, 50),
              //                 backgroundColor: Color(0xFFE0E0E0),
              //               ),
              //               child: Text("Denied",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "Kavoon",color: Color(0xFFF90303))),
              //             ),
              //           ],
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      }
    );
  }
}
