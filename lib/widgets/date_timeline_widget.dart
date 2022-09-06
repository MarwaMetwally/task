import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/style/colors.dart';

class DateTimeLine extends StatelessWidget {
  const DateTimeLine({Key? key, this.onChange}) : super(key: key);
  final void Function(DateTime)? onChange;
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: 65.h,
      monthTextStyle: const TextStyle(fontSize: 0),
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.mainColor,
      selectedTextColor: Colors.white,
      onDateChange: onChange,
    );
  }
}
