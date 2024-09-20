import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_pro_app/view/custom_widgets/custom_sized.dart';

import '../../../controller/utils/custom_color.dart';
import '../../../controller/utils/custom_text_style.dart';
import '../../../model/task_pro_model.dart';
class SentToProPostcodeScreen extends StatefulWidget {
  const SentToProPostcodeScreen({super.key});

  @override
  State<SentToProPostcodeScreen> createState() => _SentToProPostcodeScreenState();
}

class _SentToProPostcodeScreenState extends State<SentToProPostcodeScreen> {
  List<TaskProModel> data = [
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
    TaskProModel(imageUrl: 'assets/png/profileImage.png', name: 'Zeeshan'),
  ];

  // RxList to track the selection state of each container
  RxList<bool> isSelectedList = List<bool>.filled(6, false).obs;

  // RxBool to track whether all items are selected or not
  RxBool isSelectAll = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          getVerticalSpace(2.h),
          SizedBox(
            height: MediaQuery.of(context).size.height * .65,
            child: ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Toggle selection for the tapped container
                    isSelectedList[index] = !isSelectedList[index];
                    isSelectedList.refresh();

                    // If all containers are selected, set isSelectAll to true, else false
                    isSelectAll.value = isSelectedList.every((selected) => selected);
                  },
                  child: Obx(
                        () => Container(
                      margin: EdgeInsets.symmetric(vertical: 1.1.h, horizontal: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.px),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 8,
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(data[index].imageUrl),
                        ),
                        title: Text(
                          data[index].name,
                          style: CustomTextStyle.textData,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar(
                              filledIcon: Icons.star,
                              filledColor: CustomColor.orangeColor1,
                              size: 12,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) => debugPrint('$value'),
                              initialRating: 5,
                              maxRating: 5,
                            ),
                            SizedBox(width: 0.5.h),
                            Text(
                              "5.0",
                              style: CustomTextStyle.textName1,
                            ),
                          ],
                        ),
                        trailing: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: isSelectedList[index]
                                ? CustomColor.orangeColor1
                                : Colors.white,
                            border: Border.all(
                              color: isSelectedList[index]
                                  ? CustomColor.orangeColor1
                                  : CustomColor.greyColor,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            color: isSelectedList[index]
                                ? Colors.white
                                : Colors.transparent,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          getVerticalSpace(1.2.h),
          Padding(
            padding: EdgeInsets.only(right: 2.h,left: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action when 'Send' is clicked
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
                    'Send',
                    style: CustomTextStyle.textSignUpWhite,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                getHorizontalSpace(2.w),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      // Toggle Select All / Deselect All
                      isSelectAll.value = !isSelectAll.value;
                      isSelectedList.value =
                      List<bool>.filled(data.length, isSelectAll.value);
                      isSelectedList.refresh();
                    },
                    child: Obx(
                          () => Flexible(
                            child: Text(
                                                    isSelectAll.value ? "Unselect all" : "Select all",
                                                    style: CustomTextStyle.textNameSelect,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.px,
            width: 10.px,
          )
        ],
      ),
    );
  }
}
