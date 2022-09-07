import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../common/style/colors.dart';
import '../common/style/fonts.dart';

class ListTaskItem extends StatelessWidget {
  const ListTaskItem({
    Key? key,
    required this.taskTitle,
    required this.taskDecription,
    required this.taskImage,
  }) : super(key: key);
  final String taskTitle;
  final String taskDecription;
  final String taskImage;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        margin: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.mainLight,
              child: Image.asset(
                taskImage,
                width: 40.w,
                height: 40.h,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    taskTitle,
                    maxLines: 2,
                    style: AppTextStyle.body
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  (AutoSizeText(
                    taskDecription,
                    maxLines: 2,
                    style: AppTextStyle.lableSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.mainLight),
                    textAlign: TextAlign.right,
                  )),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            )
          ],
        ),
        height: 130.h);
  }
}

class TaskItemTimeBadge extends StatelessWidget {
  const TaskItemTimeBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 19.w,
      bottom: 10.h,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 15.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          color: Color(0xff242424),
        ),
        child: Text(
          DateFormat('hh:mm a').format(DateTime.now()),
          style: AppTextStyle.lable
              .copyWith(color: AppColors.white, fontSize: 16.sp),
        ),
      ),
    );
  }
}
