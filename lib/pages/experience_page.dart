import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/response_data.dart';

import '../core/device_size.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  ResponseData? responseData = null;

  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var lightGreyColor = const Color(0XFF2F2F2);
  var blackColor = const Color(0XFF000000);

  int GridViewAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 3;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 2;
    } else {
      return 1;
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
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Unleashing Innovation",
            style: GoogleFonts.nunito(
                fontSize: 14.spMin,
                color: greyColor,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "Experience & Skill",
            style: GoogleFonts.nunito(
                fontSize: 24.spMin,
                color: blackColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 1,
            color: Colors.grey.shade200,
          ),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: responseData?.experiences?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: GridViewAdapter(), childAspectRatio: 3),
                itemBuilder: (BuildContext context, int index) {
                  var dataExperience = responseData?.experiences?[index];
                  return Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dataExperience?.titleJob ?? "",
                              style: GoogleFonts.nunito(
                                  fontSize: 18.spMin,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w700)),
                          Text(
                            dataExperience?.experienceDate ?? "",
                            style: GoogleFonts.nunito(
                                fontSize: 16.spMin,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            dataExperience?.company ?? "",
                            style: GoogleFonts.nunito(
                                fontSize: 16.spMin,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ));
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 1,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
