import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonColor.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Common/Common_TextStyle.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/GetSaloonController.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Screen/addSaloonScreen.dart';
import 'package:hair_beauty_salon/VendorSide/TabBarScreens/Screen/MainTabBarScreen.dart';

class SaloonListScreen extends StatefulWidget {
  const SaloonListScreen({super.key});

  @override
  State<SaloonListScreen> createState() => _SaloonListScreenState();
}

class _SaloonListScreenState extends State<SaloonListScreen> {

  GetSaloonController getSaloon_obj = Get.put(GetSaloonController());

  Future<void> controllerCallingFun() async{
    await getSaloon_obj.getSaloonListCont();
  }

  @override
  void initState() {
    super.initState();
    controllerCallingFun();
  }

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
        title: Text("Saloon List",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonElevatedButton(onPressed: (){
                    Get.to(() => AddSaloonScreen());
                  }),
                ],
              ),

              SizedBox(height: Get.height*0.05,),

              Obx(
                () {
                  return getSaloon_obj.loading.value
                      ?
                  Center(child: CircularProgressIndicator(color: common_clr,),)
                      :
                  getSaloon_obj.allSaloons.length == 0
                      ?
                  Center(child: Text("No Saloon Found!"),)
                      :
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: Get.height*0.03,
                    crossAxisSpacing: Get.width*0.11,
                    children: List.generate(getSaloon_obj.oldResponse.value.data!.length, (index){
                      var user = getSaloon_obj.oldResponse.value.data![index];
                      return InkWell(
                        onTap: () {
                          getSaloon_obj.setSaloonId(user.id.toString());
                          Get.to(()=> MainTabBarScreen(saloonId: getSaloon_obj.oldResponse.value.data![index].id.toString()));
                          print(getSaloon_obj.oldResponse.value.data![index].id.toString());

                        },
                        child: Container(
                          height: Get.height*0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 1,
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   height: Get.height*0.1,
                              //   width: Get.width,
                              //   decoration: BoxDecoration(
                              //     color: common_clr,
                              //     image: getSaloon_obj.oldResponse.value.data![index].imagePaths == []
                              //         ?
                              //     DecorationImage(image: AssetImage("assets/images/saloon_image.png"))
                              //         :
                              //     DecorationImage(image: NetworkImage("${getSaloon_obj.oldResponse.value.data![index].imagePaths}"),fit: BoxFit.cover),
                              //     borderRadius: BorderRadius.circular(15),
                              //     // color: Colors.blueGrey
                              //   ),
                              // ),
                              CachedNetworkImage(
                                height: Get.height*0.1,
                                width: Get.width,
                                imageUrl: user.imagePaths!.length != 0
                                  ?
                                user.imagePaths![0].toString()
                                  :
                                "https://www.cutchimemonbangalore.com/assets/images/blank.png",
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: common_clr,
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.height*0.005,),

                              Text("${getSaloon_obj.oldResponse.value.data![index].name }",style: CommonTextStyle.mulish_14_w700,overflow: TextOverflow.ellipsis,),

                              Stack(
                                children: [
                                  Container(
                                    height: Get.height*0.07,
                                    width: Get.width*0.36,
                                    // color: Colors.grey,
                                  ),
                                  Container(
                                    height: Get.height*0.05,
                                    width: Get.width*0.36,
                                    // color: Colors.white,
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.all(5),
                                    child: Text("${getSaloon_obj.oldResponse.value.data![index].address}",style: CommonTextStyle.mulish_13_w300),
                                  ),

                                  Positioned(
                                    top: Get.height*0.035,
                                    right: Get.width*0.006,
                                    child: Container(
                                      height: Get.height*0.03,
                                      width: Get.width*0.06,
                                      // color: Colors.red,
                                      child: Icon(CupertinoIcons.pencil,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                }
              ),

              SizedBox(height: Get.height*0.07,),

              ContinueElevatedButton(onPressed: () {}),

              SizedBox(height: Get.height*0.015,),
            ],
          ),
        ),
      )
    );
  }
}
