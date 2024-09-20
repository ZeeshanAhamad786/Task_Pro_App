import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_pro_app/view/screens/sent_to_pro_section/sent_to_pro_postcode_screen.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
class SentToProHomeScreen extends StatefulWidget {
  const SentToProHomeScreen({super.key});

  @override
  State<SentToProHomeScreen> createState() => _SentToProHomeScreenState();
}

class _SentToProHomeScreenState extends State<SentToProHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 8.h), // Adjust spacing as needed
        Container(
          padding: EdgeInsets.only(bottom: 2.h,left: 1.h),
          decoration: const BoxDecoration(
            border:  Border(
              bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(onTap: () {
                Get.back();
              },
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
              Text("Send To Pros",style: CustomTextStyle.textStartBlack,),
              SizedBox(height: 10.px,width: 10.px,)
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 2, // Number of tabs
            child: Column(
              children: [
                // Tab bar
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border:  Border(
                      bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Align(alignment:Alignment.center ,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      // padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                      // indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: CustomColor.orangeColor1,
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: CustomTextStyle.textForgotOrange,
                      unselectedLabelColor: CustomColor.blackColor2,
                      tabs: [
                        Tab(text: " Category Based"),
                        Tab(text: "Postcode Based"),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h), // Space between TabBar and TabBarView
                const Expanded(
                  child: TabBarView(
                    children: [
                      // Content for Tab 1
                      SentToProPostcodeScreen(),
                      // Content for Tab 2
                      SentToProPostcodeScreen(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],),
    );
  }
}
