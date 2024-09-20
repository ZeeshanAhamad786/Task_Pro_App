import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/custom_color.dart';
import '../../controller/utils/custom_text_style.dart';
import 'custom_sized.dart'; // Assuming you are using the Sizer package for responsive layout

class CustomProjectOfferProposal extends StatelessWidget {
  final String projectTitle;
  final String projectDurationStartDate;
  final String projectDurationEndDate;
  final String projectCost;
  final String projectDetails;

   CustomProjectOfferProposal({
    super.key,
    required this.projectTitle,
    required this.projectDurationStartDate,
    required this.projectDurationEndDate,
    required this.projectCost,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0XFFECECEC)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            projectTitle,
            style: CustomTextStyle.textBlack1.copyWith(
              fontSize: 18.sp, // Responsive font size
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(color: CustomColor.greyColor),

          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Project Duration',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Date",
                    style: CustomTextStyle.textWithBlack,
                  ),
                  getVerticalSpace(.5),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/calenderIcon.svg"),
                      getHorizontalSpace(1.w),
                      Text(
                        projectDurationStartDate,
                        style: CustomTextStyle.textLoginBlack,
                      ),
                    ],
                  ),
                ],
              ),
              getHorizontalSpace(4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End Date",
                    style: CustomTextStyle.textWithBlack,
                  ),
                  getVerticalSpace(.5),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svg/calenderIcon.svg"),
                      getHorizontalSpace(1.w),
                      Text(
                        projectDurationEndDate,
                        style: CustomTextStyle.textLoginBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cost of the project',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          getVerticalSpace(.4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              projectCost,
              style: CustomTextStyle.textLoginOrange,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Project Details',
              style: CustomTextStyle.textAccountBlack1,
            ),
          ),
          SizedBox(height: 1.h), // Responsive vertical spacing
          Text(
            projectDetails,
            style: CustomTextStyle.textOpiBlack,
          ),
          getVerticalSpace(1.1.h),
          Center(
            child: ElevatedButton(
              onPressed: () {
                projectCostPaymentDialog(context);
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
                'Approve',
                style: CustomTextStyle.textSignUpWhite,overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
  void projectCostPaymentDialog(BuildContext context) {
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        'Project Cost Payment',
                        style: CustomTextStyle.textBlack1.copyWith(
                          fontSize: 16.px, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(onTap: () {
                        Get.back();
                      },
                          child: Icon(Icons.cancel))
                    ],
                  ),
                  const Divider(color: CustomColor.greyColor,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your balance ',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$16',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Project Cost',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$120',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Admin Fee ',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$25',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      '7% of total (min. 2.5\$)',
                      style: CustomTextStyle.textName2,
                    ),
                  ),
                  const Divider(color: CustomColor.greyColor,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Fee',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$10',
                        style: CustomTextStyle.textRed1,
                      ),

                    ],
                  ),

                  SizedBox(height: 2.h), // Responsive vertical spacing
                  GestureDetector(
                    onTap: () {
                      showPaymentBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h, // Responsive vertical padding
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.greenColor,
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      child: Text(
                        'Pay Now',
                        style: CustomTextStyle.textAccountBlack.copyWith(
                            color: Colors.white,
                            fontSize: 16.sp, overflow: TextOverflow.ellipsis // Responsive font size
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15, width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void siteVisitPaymentFeeDialog(BuildContext context) {
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        'Site Visit Payment Fee',
                        style: CustomTextStyle.textBlack1.copyWith(
                          fontSize: 16.px, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(onTap: () {
                        Get.back();
                      },
                          child: Icon(Icons.cancel))
                    ],
                  ),
                  const Divider(color: CustomColor.greyColor,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your balance ',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$16',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Site Visit Charges',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$120',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Admin Fee ',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$25',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      '7% of total (min. 2.5\$)',
                      style: CustomTextStyle.textName2,
                    ),
                  ),
                  const Divider(color: CustomColor.greyColor,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Fee',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$10',
                        style: CustomTextStyle.textRed1,
                      ),

                    ],
                  ),

                  SizedBox(height: 2.h), // Responsive vertical spacing
                  GestureDetector(
                    onTap: () {
                      showPaymentBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h, // Responsive vertical padding
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.greenColor,
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      child: Text(
                        'Pay Now',
                        style: CustomTextStyle.textAccountBlack.copyWith(
                            color: Colors.white,
                            fontSize: 16.sp, overflow: TextOverflow.ellipsis // Responsive font size
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15, width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void siteVisitPaymentRechargeDialog(BuildContext context) {
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      Text(
                        'Site Visit Payment Fee',
                        style: CustomTextStyle.textBlack1.copyWith(
                          fontSize: 18.sp, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(onTap: () {
                        Get.back();
                      },
                          child: Icon(Icons.cancel))
                    ],
                  ),
                  const Divider(color: CustomColor.greyColor,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your balance ',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$06',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Site Visit Payment Fee',
                        style: CustomTextStyle.textOpiBlack,
                      ),
                      Text(
                        '\$10',
                        style: CustomTextStyle.textOpiBlack,
                      ),

                    ],
                  ),
                  const Divider(color: CustomColor.greyColor,),

                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'You need to recharged',
                        style: CustomTextStyle.textRed1,
                      ),
                      Text(
                        '-\$10',
                        style: CustomTextStyle.textRed1,
                      ),

                    ],
                  ),

                  SizedBox(height: 2.h), // Responsive vertical spacing
                  GestureDetector(
                    onTap: () {
                      showPaymentBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 1.h, // Responsive vertical padding
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColor.orangeColor1,
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      child: Text(
                        'Recharged Now',
                        style: CustomTextStyle.textAccountBlack.copyWith(
                            color: Colors.white,
                            fontSize: 16.sp, overflow: TextOverflow.ellipsis // Responsive font size
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15, width: 15,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final FocusNode cardNumberFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cvvFocus = FocusNode();
  final FocusNode cardHolderNameFocus = FocusNode();
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
            bottom: MediaQuery
                .of(context)
                .viewInsets
                .bottom,
            left: 16.0,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/svg/card-add.svg"),
                  getHorizontalSpace(2.w),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add card", style: CustomTextStyle.textBlack1,),
                        getVerticalSpace(.3.h),
                        Text(
                          "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
                          style: CustomTextStyle.textLight,),
                      ],
                    ),
                  )
                ],
              ),
              getVerticalSpace(1.h),
              Divider(color: CustomColor.greyColor,),
              getVerticalSpace(4.h),
              TextFormField(
                focusNode: cardNumberFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "00000",
                  hintStyle: CustomTextStyle.textBlack1,
                  labelText: 'Card Number',
                  labelStyle: cardNumberFocus.hasFocus
                      ? CustomTextStyle.textForgotOrange
                      : CustomTextStyle.textBlack1,
                  suffixIcon: Transform.scale(
                    scale: .4,
                    child: SvgPicture.asset(
                      "assets/svg/cardNumberIcon.svg",
                      color: cardNumberFocus.hasFocus
                          ? CustomColor.orangeColor1
                          : CustomColor.greyColor7,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: expiryDateFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "MM/YY",
                        hintStyle: CustomTextStyle.textBlack1,
                        labelText: 'Expiry Date',
                        labelStyle: expiryDateFocus.hasFocus
                            ? CustomTextStyle.textForgotOrange
                            : CustomTextStyle.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: .4,
                          child: SvgPicture.asset(
                            "assets/svg/expiryDateIcon.svg",
                            color: expiryDateFocus.hasFocus
                                ? CustomColor.orangeColor1
                                : CustomColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: CustomColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: CustomColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 2.h),
                  Expanded(
                    child: TextFormField(
                      focusNode: cvvFocus,
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        hintText: "***",
                        hintStyle: CustomTextStyle.textBlack1,
                        labelText: 'CVV',
                        labelStyle: cvvFocus.hasFocus
                            ? CustomTextStyle.textForgotOrange
                            : CustomTextStyle.textBlack1,
                        contentPadding: const EdgeInsets.all(10),
                        suffixIcon: Transform.scale(
                          scale: 0.4,
                          child: SvgPicture.asset(
                            "assets/svg/ccvIcon.svg",
                            color: cvvFocus.hasFocus
                                ? CustomColor.orangeColor1
                                : CustomColor.greyColor7,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: CustomColor.orangeColor1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: CustomColor.greyColor7),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              TextFormField(
                focusNode: cardHolderNameFocus,
                decoration: InputDecoration(
                  isDense: true,
                  isCollapsed: true,
                  hintText: "Enter cardholder’s full name",
                  hintStyle: CustomTextStyle.textBlack1,
                  labelText: 'Cardholder’s Name',
                  labelStyle: cardHolderNameFocus.hasFocus
                      ? CustomTextStyle.textForgotOrange
                      : CustomTextStyle.textBlack1,
                  contentPadding: const EdgeInsets.all(10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.orangeColor1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: CustomColor.greyColor7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  siteVisitPaymentFeeDialog(context);
                },
                child: Text(
                  'Pay Now',
                  style: CustomTextStyle.textSignUpWhite,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.orangeColor2,
                  padding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                    horizontal: 20.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
              ),
              SizedBox(height: 10.px, width: 10.px,)
            ],
          ),
        );
      },
    );
  }

}


// ProjectOfferProposal(
// projectTitle: 'Project offer Proposal',
// projectDurationStartDate: '12/2/2024',
// projectDurationEndDate: '15/4/2024',
// projectCost: '15\$',
// projectDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
// )