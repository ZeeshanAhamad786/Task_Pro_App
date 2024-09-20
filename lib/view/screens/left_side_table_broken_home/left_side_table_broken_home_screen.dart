import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_sized.dart';
import '../my_task_section/my_task_contract_details.dart';
import '../my_task_section/my_task_details.dart';

class LeftSideTableBrokenHome extends StatefulWidget {
  const LeftSideTableBrokenHome({super.key});

  @override
  State<LeftSideTableBrokenHome> createState() => _LeftSideTableBrokenHomeState();
}

class _LeftSideTableBrokenHomeState extends State<LeftSideTableBrokenHome> {
  PageController controller = PageController();
  CalendarController calendarController=Get.put(CalendarController());
  // Method to navigate to the next image
  void nextPage() {
    if (controller.page != 2) { // Assuming you have 3 images, adjust index as needed
      controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  // Method to navigate to the previous image
  void previousPage() {
    if (controller.page != 0) {
      controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          getVerticalSpace(8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Flexible(
                  child: Text(
                    "The left side leg of the table is broken",
                    style: CustomTextStyle.textLeft,overflow: TextOverflow.ellipsis,
                  ),
                ),
                PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (int result) {
                    // Handle the selected menu item
                    print('Selected: $result');
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[

                    PopupMenuItem<int>(
                      value: 1,
                      child: GestureDetector(onTap: () {
                        // Get.to(()=>const ProfileDetailsScreen());
                      },
                          child: Text('Edit',style: CustomTextStyle.textAddBlack6,)),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      child: GestureDetector(onTap: () {
                        deleteDialog(context);
                      },
                          child: Text('Delete',style: CustomTextStyle.textAddBlack6,)),
                    ),
                  ],
                  color: Colors.white,

                ),

              ],
            ),
          ),
          getVerticalSpace(1.2.h),
          Stack(
            children: [
              // PageView to handle image scrolling
              SizedBox(
                height: 240.px, // Set a height to prevent layout issues
                child: PageView(
                  controller: controller,
                  children: [
                    Image.asset("assets/png/tableImage.png", ),
                    Image.asset("assets/png/tableImage.png",
                    ),
                    Image.asset("assets/png/tableImage.png", ),
                  ],
                ),
              ),
              // Left arrow
              Positioned(
                bottom: 5.h,
                left: 2.h,
                child: GestureDetector(
                  onTap: previousPage,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Right arrow
              Positioned(
                bottom: 5.h,
                right: 2.h,
                child: GestureDetector(
                  onTap: nextPage,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Page Indicator
              Positioned(
                bottom: 2.2.h,
                left: MediaQuery.of(context).size.width * 0.45,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3, // The number of pages/images
                  axisDirection: Axis.horizontal,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: CustomColor.orangeColor1,
                  ),
                ),
              )
            ],
          ),
         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 2.h),
           child: Column(mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             getVerticalSpace(2.h),
             Text("Task Details ",style: CustomTextStyle.textNameBlack6,),
             getVerticalSpace(1.h),
             Text("Task Title",style: CustomTextStyle.textAccountBlack1,),
             getVerticalSpace(.4.h),
             Text("The left side leg of the table is broken.",style: CustomTextStyle.textNameBlackNew,),
             getVerticalSpace(1.h),
             Divider(color: CustomColor.greyColor,),
             getVerticalSpace(1.h),
             Text("Service Category",style: CustomTextStyle.textAccountBlack1,),
             getVerticalSpace(.4.h),
             Text("Carpenter",style:CustomTextStyle.textCarpenter ,),
             getVerticalSpace(1.h),
             const Divider(color: CustomColor.greyColor,),
             getVerticalSpace(1.h),
             Text("Task Description ",style: CustomTextStyle.textAccountBlack1,),
             getVerticalSpace(.4.h),
             Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
               style:CustomTextStyle.textDesc ,),
             getVerticalSpace(1.h),
             const Divider(color: CustomColor.greyColor,),
             getVerticalSpace(1.h),
             Text("Contact Email/Phone Number",style:CustomTextStyle.textAccountBlack1 ,),
             getVerticalSpace(.4.h),
             Text("Example@gmail.com",style: CustomTextStyle.textDesc,),
             getVerticalSpace(1.h),
             const Divider(color: CustomColor.greyColor,),
             getVerticalSpace(1.h),
             Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Location",style:CustomTextStyle.textAccountBlack1 ),
                 Text("(Postcode)",style: CustomTextStyle.textPostcode,),
               ],
             ),
             getVerticalSpace(.4.h),
             Text("0901116",style: CustomTextStyle.textDesc,),
             getVerticalSpace(1.h),
             const Divider(color: CustomColor.greyColor,),
             getVerticalSpace(1.h),
             Text("Preferred Date Range",style:CustomTextStyle.textData ,),
             getVerticalSpace(1.h),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,

               children: [
                 Text("Start Date"),
                 getHorizontalSpace(15.w),
                 Text("End Date"),
               ],
             ),
             getVerticalSpace(.7.h),
             Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 GestureDetector(onTap: () {
                   calendarController.selectStartDate(context);

                 },
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       SvgPicture.asset(
                         "assets/svg/calenderIcon.svg",
                       ),
                       SizedBox(width: 2.w),
                       Text(
                         DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),
                         style: CustomTextStyle.textLoginBlack,
                       ),
                     ],
                   ),
                 ),
                 getHorizontalSpace(2.5.w),
                 Text("To",style: CustomTextStyle.textSeeAllOrange1,),
                 getHorizontalSpace(2.5.w),

                 Obx(() => GestureDetector(onTap: () {
                   calendarController.selectEndDate(context);
                 },
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       SizedBox(width: 2.w),

                       SvgPicture.asset(
                         "assets/svg/calenderIcon.svg",
                       ),
                       SizedBox(width: 2.w),
                       Text(
                         DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),
                         style: CustomTextStyle.textLoginBlack,
                       ),
                     ],
                   ),
                 )),
               ],
             )),
             SizedBox(height: 20.px,width: 20.px,)

           ],),
         )
        ],),
      ),
    );
  }
  void deleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  getVerticalSpace(2.h),
                  Text(
                    'Delete Task',
                    style: CustomTextStyle.textBlack1.copyWith(
                      fontSize: 18.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color:CustomColor.greyColor ,),

                  SizedBox(height: 5.h), // Responsive vertical spacing
                  Text(
                    'Do you really want to Delete the Task',
                    style: CustomTextStyle.redColor3,
                  ),
                  SizedBox(height: 4.h), // Responsive vertical spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.2.h, // Responsive vertical padding
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:     CustomColor.redColor3,
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Text(
                              'Yes',
                              style: CustomTextStyle.textAccountBlack.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp, // Responsive font size
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.h), // Responsive horizontal spacing
                      Expanded(
                          child:
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child:
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1.2.h, // Responsive vertical padding
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xff34C759),
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(color: const Color(0xff34C759)),
                              ),
                              child: Text(
                                'No',
                                style: CustomTextStyle.textForgotOrange.copyWith(
                                  color: Colors.white,
                                  fontSize: 16.sp, // Responsive font size
                                ),
                              ),
                            ),)
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }}


