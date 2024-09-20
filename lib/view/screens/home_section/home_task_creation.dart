import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_pro_app/view/custom_widgets/custom_sized.dart';
import 'package:task_pro_app/view/screens/sent_to_pro_section/sent_to_pro_home_screen.dart';
import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../../controller/utils/image_picker_controller.dart';
import '../../custom_widgets/custom_business_details_text_form_field.dart';
import '../../custom_widgets/custom_task_creation_textfield.dart';
class HomeTaskCreation extends StatefulWidget {
  const HomeTaskCreation({super.key});

  @override
  State<HomeTaskCreation> createState() => _HomeTaskCreationState();
}
class _HomeTaskCreationState extends State<HomeTaskCreation> {
  CalendarController calendarController=Get.put(CalendarController());
  ImagePickerController imagePickerController =Get.put(ImagePickerController());
  RxBool isPreferredDateSelected = true.obs; // Your condition for "Preferred Date Range"
  RxBool isUrgencyDateSelected = false.obs;
  RxString? chooseCategory = RxString('');
  final List<String> category = ["1", "2",
    "3", "4"];// Your condition for "Preferred Date Range"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 8.h), // Adjust spacing as needed
          Container(
            padding: EdgeInsets.only(bottom: 2.h),
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
                Text("Task Creation",style: CustomTextStyle.textStartBlack,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
          ),
          getVerticalSpace(2.1.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    imagePickerController.getImage(); // Call the method to select an image
                  },
                  child:Obx(()=>ClipRRect(borderRadius: BorderRadius.circular(16.px),
                    child: imagePickerController.imagePath.value.isNotEmpty
                        ? Image.file(
                      File(imagePickerController.imagePath.value),
                      fit: BoxFit.cover,width: double.infinity,height: 220,
                    ): Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColor.greyColor9),
                          borderRadius: BorderRadius.circular(16.px),
                        ),
                        // Check if imagePath has content and display image, otherwise show "Upload File" UI
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/svg/gallery.svg"),
                            getVerticalSpace(1.1.h),
                            Text(
                              "Upload File",
                              style: CustomTextStyle.textForgotOrange1,
                            ),
                          ],
                        )
                    ),
                  ))
                ),

                getVerticalSpace(2.1.h),
                Text("Task Details ",style: CustomTextStyle.textNameBlack6,),
                getVerticalSpace(1.1.h),
                Text("Task Title",style: CustomTextStyle.textAccountBlack1,),
                getVerticalSpace(1.h),
                const CustomTaskCreationTextField(),
                getVerticalSpace(1.1.h),
                Text("Service Category",style: CustomTextStyle.textAccountBlack1,),
                getVerticalSpace(1.h),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color:CustomColor.greyColor9),
                    borderRadius: BorderRadius.circular(8),),
                  child: DropdownButtonHideUnderline(
                    child: Obx(() {
                      return DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          chooseCategory!.value.isEmpty ? 'Non selected ' : chooseCategory!.value,
                          style:CustomTextStyle.textAccountBlack,
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: category.map((String communityName) {
                          return DropdownMenuItem<String>(
                            value: communityName,
                            child: Text(
                              communityName,
                              style:CustomTextStyle.textAccountBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          chooseCategory!.value = value!;
                        },
                      );
                    }),
                  ),
                ),
                getVerticalSpace(1.1.h),
                Text("Description",style: CustomTextStyle.textAccountBlack1,),
                getVerticalSpace(1.h),
                const CustomBusinessDetailsField(),
                getVerticalSpace(1.1.h),
                Text("Contact Email/Phone Number",style: CustomTextStyle.textAccountBlack1,),
                getVerticalSpace(1.h),
                const CustomTaskCreationTextField(),
                getVerticalSpace(1.1.h),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Location",style: CustomTextStyle.textAccountBlack1,),
                    getHorizontalSpace(1.5.w),
                    Text("(Postcode)",style: CustomTextStyle.textAccountBlack,),
                  ],
                ),
                getVerticalSpace(1.h),
                const CustomTaskCreationTextField(),
                getVerticalSpace(1.1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Preferred Date Range Text and Container
                Text(
                  "Preferred Date Range",
                  style: CustomTextStyle.textNameBlack6,
                ),
                SizedBox(width: 10), // Space between text and container

                // Preferred Date Range Container wrapped with Obx
                Obx(() => GestureDetector(onTap: () {
                  isPreferredDateSelected.value=true;
                  isUrgencyDateSelected.value=false;
                },
                  child: Container(
                    height: 25.px,
                    width: 25.px,
                    padding: EdgeInsets.all(4.px), // Add padding to create the gap
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isPreferredDateSelected.value
                            ? CustomColor.orangeColor1
                            : CustomColor.greyColor,
                      ),
                    ),
                    child: Container(
                      height: 20.px, // Adjust the size of the inner container
                      width: 20.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isPreferredDateSelected.value
                            ? CustomColor.orangeColor1
                            : Colors.white,
                      ),
                    ),
                  ),
                )),
                SizedBox(width: 20), // Space between two widgets

                // Urgency Text and Container
                Text(
                  "Urgency",
                  style: CustomTextStyle.textNameBlack6,
                ),
                SizedBox(width: 10), // Space between text and container

                // Urgency Container wrapped with Obx
                Obx(() => GestureDetector(onTap: () {
                  isPreferredDateSelected.value=false;
                  isUrgencyDateSelected.value=true;

                },
                  child: Container(
                    height: 25.px,
                    width: 25.px,
                    padding: EdgeInsets.all(4.px), // Add padding to create the gap
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isUrgencyDateSelected.value
                            ? CustomColor.orangeColor1
                            : CustomColor.greyColor,
                      ),
                    ),
                    child: Container(
                      height: 20.px, // Adjust the size of the inner container
                      width: 20.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isUrgencyDateSelected.value
                            ? CustomColor.orangeColor1
                            : Colors.white,
                      ),
                    ),
                  ),
                )),
              ],
            ),
                getVerticalSpace(1.1.h),
                Obx(() => Opacity(
                  opacity: !isUrgencyDateSelected.value ? 1 : 0.5, // Reduce opacity when disabled
                  child: AbsorbPointer(
                    absorbing: isUrgencyDateSelected.value, // Disable interactions when true
                    child: Column(
                      children: [
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
                                    "assets/svg/calenderIcon.svg",color: isUrgencyDateSelected.value?CustomColor.greyColor:CustomColor.orangeColor1,
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
                            Text("To",style:isUrgencyDateSelected.value?CustomTextStyle.textNameGreyColor: CustomTextStyle.textSeeAllOrange1,),
                            getHorizontalSpace(2.5.w),

                            Obx(() => GestureDetector(onTap: () {
                              calendarController.selectEndDate(context);
                            },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: 2.w),

                                  SvgPicture.asset(
                                    "assets/svg/calenderIcon.svg",color: isUrgencyDateSelected.value?CustomColor.greyColor:CustomColor.orangeColor1
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
                      ],
                    ),
                  ),
                ))
              ],),
          ),
          getVerticalSpace(5.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>const SentToProHomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.orangeColor1,
                padding: EdgeInsets.symmetric(
                  vertical: 1.5.h,
                  horizontal: 18.w,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Create',
                style: CustomTextStyle.textSignUpWhite,
              ),
            ),
          ),

SizedBox(height: 2.h,width: 2.h,)
        ],),
      ),
    );
  }
}
