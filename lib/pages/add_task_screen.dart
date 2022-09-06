import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mytask/common/paths.dart';
import 'package:mytask/common/style/colors.dart';

import '../common/constants.dart';
import '../common/style/fonts.dart';
import '../widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int currentInex = 0;
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.06,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Icon(
                      Icons.short_text_rounded,
                      size: 45,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create New Task",
                            style: AppTextStyle.displayLarge,
                          ),
                          SvgPicture.asset(
                            Paths.taskIcon,
                            color: AppColors.mainLight,
                            width: 45.w,
                          )
                        ],
                      ),
                      const CustomTextField(
                        lableText: "Task Name",
                        hintText: "Enter Task Name",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Category",
                            style: AppTextStyle.lable
                                .copyWith(color: AppColors.mainColor),
                          ),
                          Text(
                            "See all",
                            style: AppTextStyle.lableSmall
                                .copyWith(color: AppColors.mainLight),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 32,
                        child: ListView.separated(
                          itemCount: Constants.categories.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  currentInex = index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                    color: currentInex == index
                                        ? AppColors.mainColor
                                        : AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: currentInex == index
                                            ? Colors.transparent
                                            : AppColors.mainLight,
                                        width: 2)),
                                child: Text(
                                  Constants.categories[index],
                                  style: AppTextStyle.lableSmall.copyWith(
                                      color: currentInex == index
                                          ? AppColors.white
                                          : AppColors.mainColor),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            width: 15.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: deviceWidth * 0.55,
                              child: CustomTextField(
                                controller: dateController,
                                lableText: "Date",
                                hintText: "Select date",
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final DateTime? selectedDate =
                                    await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1998),
                                        lastDate: DateTime(2025));

                                dateController.text = DateFormat('EEEE,d MMM')
                                    .format(selectedDate!);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: EdgeInsets.only(right: 10.w),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.mainColor),
                                child: SvgPicture.asset(
                                  Paths.calendarIcon,
                                  color: AppColors.white,
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextField(
                                controller: startTimeController,
                                hintText: "Start time",
                                lableText: "Start time",
                                withSuffixIcon: true,
                                onTap: () async {
                                  await pickTime(context, startTimeController);
                                }),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Expanded(
                            child: CustomTextField(
                                controller: endTimeController,
                                hintText: "End time",
                                lableText: "End time",
                                withSuffixIcon: true,
                                onTap: () async {
                                  await pickTime(context, endTimeController);
                                }),
                          ),
                        ],
                      ),
                      const CustomTextField(
                        lableText: "Description",
                        hintText: "Enter task Description",
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                  vertical: 12,
                                )),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  // side: const BorderSide(),
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            onPressed: () {},
                            child: Text(
                              "Create Task",
                              style: AppTextStyle.displayLarge.copyWith(
                                  color: AppColors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

pickTime(BuildContext context, TextEditingController controller) async {
  final TimeOfDay? timeOfDay = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.dial,
  );
  final now = DateTime.now();

  controller.text = DateFormat('hh:mm a').format(DateTime(
      now.year, now.month, now.day, timeOfDay!.hour, timeOfDay.minute));
}
