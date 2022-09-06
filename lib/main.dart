import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mytask/common/theme.dart';
import 'package:mytask/routes/customRoutes.dart';
import 'package:mytask/routes/route_names.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 737.4545454545455),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: homeRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
