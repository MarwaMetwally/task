import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/constants.dart';
import '../common/paths.dart';
import '../common/style/colors.dart';
import '../common/style/fonts.dart';
import '../routes/route_names.dart';
import '../widgets/container_waves.dart';
import '../widgets/date_timeline_widget.dart';
import 'package:intl/intl.dart' as intl;

import '../widgets/list_task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dayName = "Today";
  DateTime date = DateTime.now();
  final today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: AppColors.mainColor,
              height: deviceHeight,
              width: deviceWidth,
            ),
            ClipPath(
              clipper: ContainerWaves(),
              child: CurvedContainer(
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.short_text_rounded,
                            size: 45,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Stack(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: AppColors.mainColor,
                                size: 40,
                              ),
                              Positioned(
                                left: 8.w,
                                bottom: 5.h,
                                child: CircleAvatar(
                                  radius: 6,
                                  child: Text(
                                    "6",
                                    style: AppTextStyle.lableSmall.copyWith(
                                        color: AppColors.white, fontSize: 6.sp),
                                  ),
                                  backgroundColor: AppColors.badgeColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Task",
                          style: AppTextStyle.displayLarge,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed(addTaskRoute),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: deviceWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            today == date ? "Today" : dayName,
                            style: AppTextStyle.body
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            intl.DateFormat('EEEE,d MMM').format(date),
                            style: AppTextStyle.lableSmall.copyWith(
                              color: AppColors.mainLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DateTimeLine(onChange: (fullDate) {
                      setState(() {
                        date = fullDate;
                        dayName = intl.DateFormat('EEEE').format(date);
                      });
                    }),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 30.w,
              top: 35.h,
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(Paths.profilePic),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Positioned(
                left: 24.w,
                right: 0,
                bottom: 0,
                top: deviceHeight * 0.46,
                child: Scrollbar(
                  controller: _scrollController,
                  trackVisibility: true,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          //physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Stack(
                                children: [
                                  SizedBox(
                                    height: 150.h,
                                  ),
                                  ListTaskItem(
                                    taskTitle: Constants.taskTitle[index],
                                    taskDecription:
                                        Constants.taskDescription[index],
                                    taskImage: Constants.taskImages[index],
                                  ),
                                  const TaskItemTimeBadge()
                                ],
                              ),
                          itemCount: Constants.taskTitle.length),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
