import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_pro_app/view/screens/my_task_section/my_task_table_broken_home.dart';

import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../../model/task_pro_active_model.dart';
import '../../custom_widgets/custom_sized.dart';

class TaskProActiveScreen extends StatefulWidget {
  const TaskProActiveScreen({super.key});
  @override
  State<TaskProActiveScreen> createState() => _TaskProActiveScreenState();
}
class _TaskProActiveScreenState extends State<TaskProActiveScreen> {
  List<TaskProActiveModel> data = [
    TaskProActiveModel(category: 'Carpenter', imageUrl: 'assets/png/carpenterImage.png', name: 'The left side leg of the table is broken.',
        time: '2 Days ago', weak: 'Start Today', month: '12 May'),
    TaskProActiveModel(category: 'Electrician', imageUrl: 'assets/png/electricianImage.png', name: 'The left side leg of the table is broken.',
        time: '6 hours ago', weak: 'Start Yesterday', month: '12 May'),
    TaskProActiveModel(category: 'Plumber', imageUrl: 'assets/png/plumberImage.png', name: 'The left side leg of the table is broken.',
        time: 'Yesterday ', weak: 'Start 30/06/24', month: '12 May'),
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(children: [
          getVerticalSpace(2.h),
          Expanded(
            child: GestureDetector(onTap:() {
              Get.to(()=>const MyTaskTableBrokenHome());
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
                        Row(
                          children: [
                            Text(data[index].weak, style: CustomTextStyle.textBlackColor5),
                            getHorizontalSpace(2.w),
                            Expanded(child: Divider(color: CustomColor.greyColor.withOpacity(.5),))
                          ],
                        ),
                        getVerticalSpace(1.2.h),
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
      ),
    );
  }
  void upgradePopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
              padding: EdgeInsets.symmetric(
                horizontal: 2.h, // Responsive horizontal padding
                vertical: 2.h, // Responsive vertical padding
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Upgrade To Pro',
                            style: CustomTextStyle.textBlack1.copyWith(
                              fontSize: 18.sp, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(onTap: () {
                        Get.back();
                      },
                          child: SvgPicture.asset("assets/svg/crossIcon.svg",))
                    ],
                  ),
                  const Divider(color:CustomColor.greyColor ,),
                  SizedBox(height: 2.h),
                  Image.asset("assets/png/proIcon.png",height: 140.px,width: 140.px,),
                  SizedBox(height: 2.h), // Responsive vertical spacing
                  Text(
                    'Get access to advanced features',
                    style: CustomTextStyle.textTask.copyWith(
                      fontSize: 16.sp, // Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                  getVerticalSpace(1.2.h),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.h),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svg/tick.svg"),
                        getHorizontalSpace(1.w),
                        Text("Chat with clients",style: CustomTextStyle.textTaskChat,),
                        const Spacer(),
                        SvgPicture.asset("assets/svg/tick.svg"),
                        getHorizontalSpace(1.w),
                        Text("Chat with clients",style: CustomTextStyle.textTaskChat,),
                      ],
                    ),
                  ),
                  getVerticalSpace(1.2.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svg/tick.svg"),
                        getHorizontalSpace(1.w),
                        Text("Access to client details",style: CustomTextStyle.textTaskChat,),
                        const Spacer(),
                        SvgPicture.asset("assets/svg/tick.svg"),
                        getHorizontalSpace(1.w),
                        Text("Schedule site visits",style: CustomTextStyle.textTaskChat,),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.2.h), // Responsive vertical spacing
                  GestureDetector(
                    onTap: () {
                      // Handle 'Yes' action
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 1.2.h, // Responsive vertical padding
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.orangeColor1,
                        borderRadius: BorderRadius.circular(1.3.h),
                      ),
                      child: Text(
                        'Buy Now at \$19.99',
                        style: CustomTextStyle.textAccountBlack.copyWith(
                          color: Colors.white,
                          fontSize: 16.sp, // Responsive font size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }}


