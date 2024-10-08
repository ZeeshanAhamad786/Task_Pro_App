import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/calender_controller.dart';
import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../custom_widgets/custom_review_text_field.dart';
import '../../custom_widgets/custom_sized.dart';
import '../profile_section/profile_detail_screen.dart';
class LeftSideTableContractDetails extends StatefulWidget {
  const LeftSideTableContractDetails({super.key});
  @override
  State<LeftSideTableContractDetails> createState() => _LeftSideTableContractDetailsState();
}

class _LeftSideTableContractDetailsState extends State<LeftSideTableContractDetails> {
  CalendarController calendarController=Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(onTap:(){
                    Get.to(()=>const ProfileDetailsScreen());
                  },
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/png/profileImage.png"),
                      radius: 24,
                    ),
                  ),
                  getHorizontalSpace(2.w),
                  GestureDetector(onTap: () {
                    Get.to(()=>const ProfileDetailsScreen());

                  },
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohsin Shop",style: CustomTextStyle.textAccountBlack1,),
                        Text("Task Details ",style: CustomTextStyle.textDetails,)
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(onTap: () {
                    // Get.to(()=>const LiveChatScreen());

                  },
                      child: SvgPicture.asset("assets/svg/messageIcon.svg")),
                  getHorizontalSpace(2.w),
                  GestureDetector(onTap: () {
                    // Get.to(()=>const LiveChatScreen());
                  },
                      child: Text("Send Message",style: CustomTextStyle.textForgotOrange,)),
                ],
              ),

              getVerticalSpace(2.h),
              Text("Contract Details",style: CustomTextStyle.textNameBlack6,),
              getVerticalSpace(1.h),
              Text("Contractor Name",style: CustomTextStyle.textAccountBlack1,),
              getVerticalSpace(.4.h),
              Text("Mohsin",style: CustomTextStyle.textNameBlackNew,),
              getVerticalSpace(.5.h),
              Divider(color: CustomColor.greyColor,),
              getVerticalSpace(1.h),
              Text("Project Duration",style:CustomTextStyle.textData ,),
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
              getVerticalSpace(1.h),
              Text("Project Cost",style: CustomTextStyle.textAccountBlack1,),
              getVerticalSpace(.4.h),
              Text("120\$",style: CustomTextStyle.textCarpenter,),
              getVerticalSpace(.5.h),
              Divider(color: CustomColor.greyColor,),
              getVerticalSpace(1.h),
              Text("Project Details ",style: CustomTextStyle.textAccountBlack1,),
              getVerticalSpace(.4.h),
              Text("""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                style:CustomTextStyle.textDesc ,),
              getVerticalSpace(.5.h),
              const Divider(color: CustomColor.orangeColor1,),
              Text("Project is complete ",style: CustomTextStyle.textAccountBlack1,),
              getVerticalSpace(.4.h),
              Text("After your confirmation deposit is released to the pro",style:CustomTextStyle.textAddBlack6 ,),
              getVerticalSpace(3.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showPaymentBottomSheet(context);
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
                    'Confirm',
                    style: CustomTextStyle.textSignUpWhite,
                  ),
                ),
              ),
              SizedBox(height: 20.px,width: 20.px,)
            ],
          ),
        ),
      ),
    );
  }
  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text("Review",style: CustomTextStyle.textReview,)),
                        getVerticalSpace(.3.h),
                        Center(
                          child: Text("Kindly share your feedback",
                            style: CustomTextStyle.textReview1,),
                        ),
                        getVerticalSpace(3.h),
                        const Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/png/reviewProfile.png"),
                            radius: 40,
                          ),
                        ),
                        getVerticalSpace(1.h),
                        Center(child: Text("Mohsin", style: CustomTextStyle.textName)),
                        getVerticalSpace(0.3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar(
                              filledIcon: Icons.star,
                              filledColor: CustomColor.orangeColor1,
                              size: 40,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) => debugPrint('$value'),
                              initialRating: 5,
                              maxRating: 5,
                            ),

                          ],
                        ),
                        getVerticalSpace(1.h),
                        const CustomReviewTextField(hintText: "Comment",),
                        getVerticalSpace(1.5.h),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: CustomColor.blackColor2),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: CustomTextStyle.textReviewCancel,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            getHorizontalSpace(4.w),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your deposit logic here
                                },
                                child: Text(
                                  'Summit',
                                  style: CustomTextStyle.textSubmit,overflow: TextOverflow.ellipsis,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: CustomColor.orangeColor2,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.px,width: 20.px,)
                      ],
                    ),
                  )
                ],
              ),


            ],
          ),
        );
      },
    );
  }

}
