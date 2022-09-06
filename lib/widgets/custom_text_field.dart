import 'package:flutter/material.dart';

import '../common/style/colors.dart';
import '../common/style/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText = "",
    required this.lableText,
    this.withSuffixIcon = false,
    this.onTap,
    this.controller,
  }) : super(key: key);
  final String hintText;
  final String lableText;
  final bool withSuffixIcon;
  final void Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          lableText,
          style: AppTextStyle.lable.copyWith(color: AppColors.mainColor),
        ),
        TextField(
          controller: controller,
          style: AppTextStyle.body
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20),
          decoration: InputDecoration(
              suffixIcon: withSuffixIcon
                  ? InkWell(
                      onTap: onTap,
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.mainColor,
                        size: 40,
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: AppTextStyle.lable),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
