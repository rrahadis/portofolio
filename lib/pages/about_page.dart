import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/response_data.dart';

import '../core/device_size.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

  ResponseData? responseData = null;

  double RadiusCardAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 30;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 15;
    } else {
      return 8;
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
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
          child: Image.asset(
            "images/img_banner_section.png",
            width: 60.dg,
            height: 60.dg,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
            child: Container(
                height: 60.dg,
                margin: EdgeInsets.only(right: 8.w, top: 20.h),
                padding: EdgeInsets.all(5.dg),
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(RadiusCardAdapter()),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "As a Mobile Developer",
                            style: GoogleFonts.nunito(
                                fontSize: 4.sp,
                                color: greyColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "I've navigated the journey of building ",
                                      style: GoogleFonts.lexend(
                                          fontSize: 11.sp,
                                          color: blackColor,
                                          fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text: "technology solutions",
                                      style: GoogleFonts.lexend(
                                          fontSize: 11.sp,
                                          color: secondaryColor,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(responseData?.purpose ?? "",
                              style: GoogleFonts.lexend(
                                  fontSize: 5.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(responseData?.howTo ?? "",
                              style: GoogleFonts.lexend(
                                  fontSize: 4.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
