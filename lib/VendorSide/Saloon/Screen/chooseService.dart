import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonBoxDecoration.dart';
import 'package:hair_beauty_salon/VendorSide/Common/CommonElevatedButton.dart';
import 'package:hair_beauty_salon/VendorSide/Saloon/Controller/AddSaloonServiceController.dart';
import '../../Common/CommonColor.dart';
import '../../Common/Common_TextStyle.dart';

class ChooseServiceScreen extends StatefulWidget {
  String ? saloon_id;
  ChooseServiceScreen({super.key,required this.saloon_id});

  @override
  State<ChooseServiceScreen> createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {

  var isChecked1 = false;
  var isChecked2 = false;
  String ? selectedService;

  void _handleCheckboxChange(int checkboxNumber){
    setState(() {
      if(checkboxNumber == 1){
        isChecked1 = true;
        isChecked2 = false;
      }else if(checkboxNumber == 2){
        isChecked1 = false;
        isChecked2 = true;
      }
      _sendToApi();
    });
  }

  Future<void> _sendToApi() async{
    if(isChecked1){
      selectedService = "1";
    }else if(isChecked2){
      selectedService = "2";
    }
    saloonService_obj.service.text = selectedService!;
  }

  final AddSaloonServiceController saloonService_obj = AddSaloonServiceController();

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
        title: Text("Choose Service",style: CommonTextStyle.label_20_kavoon_white,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.025,),

              Text("Choose Your Service",style: CommonTextStyle.label_20_kavoon,),

              SizedBox(height: Get.height*0.04,),

              Container(
                width: Get.width,
                height: Get.height*0.23,
                // color: Colors.blue,
                alignment: Alignment.center,
                decoration: isChecked1
                    ?
                CommonBoxDecoration.roundCorner_checked
                    :
                CommonBoxDecoration.roundCornder_shadowBox,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                            shape: CircleBorder(),
                            activeColor: common_clr,
                            side: BorderSide(width: 1),
                            value: isChecked1,
                            onChanged: (bool? value){
                              if(value != null && value){
                                _handleCheckboxChange(1);
                              }
                            }
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 45.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.height*0.11,
                            width: Get.width*0.23,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey,
                              image: DecorationImage(image: AssetImage("assets/images/hair_salon1.png"),fit: BoxFit.fill)
                            ),
                          ),

                          SizedBox(width: Get.width*0.06,),

                          Text("Doorstep Service",style: CommonTextStyle.label_20_kavoon,),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: Get.height*0.03,),

              Container(
                width: Get.width,
                height: Get.height*0.23,
                // color: Colors.blue,
                alignment: Alignment.center,
                decoration: isChecked2
                    ?
                CommonBoxDecoration.roundCorner_checked
                    :
                CommonBoxDecoration.roundCornder_shadowBox,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                              shape: CircleBorder(),
                              activeColor: common_clr,
                              side: BorderSide(width: 1),
                              value: isChecked2,
                              onChanged: (bool? value){
                                if(value != null && value){
                                  _handleCheckboxChange(2);
                                }
                              }
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left:50.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.height*0.11,
                            width: Get.width*0.23,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey,
                                image: DecorationImage(image: AssetImage("assets/images/hair_salon2.png"),fit: BoxFit.fill)
                            ),
                          ),

                          SizedBox(width: Get.width*0.06,),

                          Text("Saloon",style: CommonTextStyle.label_20_kavoon,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Get.height*0.15,),

              Obx(
                () {
                  return saloonService_obj.isLoading.value
                    ?
                  Center(child: CircularProgressIndicator(color: common_clr,),)
                    :
                  ContinueElevatedButton(
                    onPressed: () {
                      saloonService_obj.addServiceContFun(widget.saloon_id.toString(), saloonService_obj.service.text);
                    }
                  );
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
