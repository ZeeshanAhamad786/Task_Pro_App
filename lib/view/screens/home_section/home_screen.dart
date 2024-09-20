import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_pro_app/view/screens/home_section/home_task_creation.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../../model/home_task_model.dart';
import '../../custom_widgets/custom_sized.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/png/architect.png",
    "assets/png/carpenter.png",
    "assets/png/electrician.png",
    "assets/png/plumber.png",
  ];
  List<String> profileNames = [
    "Architect",
    "Carpenter",
    "Electrician",
    "Plumber",
  ];
  List<HomeTaskModel> data = [
    HomeTaskModel(category: 'Carpenter', imageUrl: 'assets/png/carpenterImage.png', name: 'The left side leg of the table is broken.',
        time: '2 Days ago',  month: '12 May'),
    HomeTaskModel(category: 'Electrician', imageUrl: 'assets/png/electricianImage.png', name: 'The left side leg of the table is broken.',
        time: '6 hours ago',  month: '12 May'),
    HomeTaskModel(category: 'Plumber', imageUrl: 'assets/png/plumberImage.png', name: 'The left side leg of the table is broken.',
        time: 'Yesterday ', month: '12 May'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Container(
            padding: EdgeInsets.only(bottom: 2.h),
            decoration:  BoxDecoration(
              border:  Border(
                bottom: BorderSide(width: 1.0, color: CustomColor.greyColor2), // Bottom border only
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Task Pro", style: CustomTextStyle.textSearchOrange1),

                  GestureDetector(onTap: () {
                    // Get.to(()=>const NotificationScreen());
                  },
                      child: SvgPicture.asset("assets/svg/notificationIcon.svg"))
                ],
              ),
            ),
          ),
            Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
          getVerticalSpace(2.h),
          Align(alignment: Alignment.centerLeft,
            child: Text(
              "Featured Services",
              style: CustomTextStyle.textBlackColor,
            ),
          ),
          getVerticalSpace(1.3.h),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Get.to(()=>const FavouriteHomeScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1),spreadRadius: 0,blurRadius: 6,offset: Offset(0, 2))
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            images[index],
                            height: 100.px,
                            width: 88.px,
                            // height: MediaQuery.of(context).size.height / 10,
                            // width: MediaQuery.of(context).size.height / 10,
                            fit: BoxFit.cover,
                          ),
                          getVerticalSpace(1.h),
                          Expanded(child: Text(profileNames[index], style: CustomTextStyle.textAudioBlack)),                          ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          getVerticalSpace(2.h),
          Align(alignment: Alignment.centerLeft,
            child: Text(
              "My Tasks",
              style: CustomTextStyle.textName,
            ),
          ),
          getVerticalSpace(2.h),
            SizedBox(height: MediaQuery.of(context).size.height*0.5,
              child: GestureDetector(onTap:() {
                // Get.to(()=>const LeftSideTableBrokenHome());
                // upgradePopUp(context);
              },
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: CustomColor.greyColor1.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  data[index].imageUrl,
                                  height: 88.px,
                                  width: 120.px,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 2.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 1.h),
                                      Text(data[index].category, style: CustomTextStyle.textBlackColor5),
                                      SizedBox(height: .7.h),
                                      Row(
                                        children: [
                                          Expanded(child: Text(data[index].name, style: CustomTextStyle.textBlackColor)),
                                          Text(data[index].month, style: CustomTextStyle.textBlackColor5),

                                        ],
                                      ),
                                      SizedBox(height: 0.2.h),
                                      Text(
                                        data[index].time,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: CustomColor.blackColor2,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )

          ],),
            )
        ],),
      ),
      floatingActionButton: SizedBox(
        height: 48.px,width: 48.px,
        child: FloatingActionButton(
          backgroundColor: CustomColor.orangeColor1,
            child: SvgPicture.asset("assets/svg/add.svg"),
            onPressed: (){
            Get.to(()=>const HomeTaskCreation());
            }),
      ),
    );
  }
}
