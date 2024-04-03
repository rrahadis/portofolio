import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/response_data.dart';

import '../core/device_size.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var lightGreyColor = const Color(0XFF2F2F2);
  var blackColor = const Color(0XFF000000);

  ResponseData? responseData = null;

  int GridViewAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 3;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 3;
    } else {
      return 2;
    }
  }

  double GridViewRadiusAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 40;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 20;
    } else {
      return 15;
    }
  }

  double GridViewMainAxisAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 40.h;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 15.h;
    } else {
      return 15.h;
    }
  }

  double GridViewMarginHorizontalAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 5.w;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 7.w;
    } else {
      return 12.w;
    }
  }

  List GridViewFontAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return [4.spMax, 5.spMax];
    } else if (DeviceSize().isMediumScreen(context)) {
      return [8.spMin, 10.spMin];
    } else {
      return [10.spMin, 12.spMin];
    }
  }

  @override
  void initState() {
    DatabaseReference database = FirebaseDatabase.instance.ref().child('data');
    database.onValue.listen((event) {
      final map = event.snapshot.value as Map;
      final response = ResponseData.fromJson(map);
      setState(() {
        responseData = response;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(GridViewRadiusAdapter()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.all(5.dg),
            margin: EdgeInsets.all(5.dg),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(GridViewRadiusAdapter()),
            ),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: responseData?.skillData?.length ?? 0,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: GridViewAdapter(),
                    mainAxisSpacing: GridViewMainAxisAdapter(),
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 3),
                itemBuilder: (BuildContext context, int index) {
                  var dataSkill = responseData?.skillData?[index];
                  return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: GridViewMarginHorizontalAdapter(),
                          vertical: 5.dg),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            BorderRadius.circular(GridViewRadiusAdapter()),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataSkill?.level ?? "",
                                  style: GoogleFonts.nunito(
                                      fontSize: GridViewFontAdapter()[0],
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                dataSkill?.name ?? "",
                                style: GoogleFonts.nunito(
                                    fontSize: GridViewFontAdapter()[1],
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )),
                          Container(
                            // margin: EdgeInsets.only(
                            //     top: 10.w, left: 10.w, right: 10.w),
                            width: 15.dm,
                            height: 15.dm,
                            child: Image.network(
                              dataSkill?.image ?? "",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
