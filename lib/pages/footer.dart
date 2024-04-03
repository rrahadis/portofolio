import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/core/firebase_analytics.dart';
import 'package:rrahadis_web/entities/response_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  ResponseData? responseData = null;

  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

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
      margin: EdgeInsets.only(top: 30.h),
      decoration: BoxDecoration(
        color: blackColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text("Got A Project?",
              style: GoogleFonts.nunito(
                  fontSize: 15.spMin,
                  color: primaryColor,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 8.h,
          ),
          Text("Let's Connect",
              style: GoogleFonts.lexend(
                  fontSize: 20.spMin,
                  color: primaryColor,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 20.h,
          ),
          Container(
            child: ElevatedButton(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Get In Touch",
                      style: GoogleFonts.nunito(
                          fontSize: 12.spMin,
                          color: primaryColor,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ))),
              onPressed: () {
                FirebaseAnalytic().logEvent("WHATSAPP_CLICKED");
                Uri waUrl = Uri.parse(
                    "https://wa.me/${responseData?.heroPhoneNumber ?? ""}?text=Hello,%20I'm%20interested");
                launchUrl(waUrl);
              },
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 1,
            color: primaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "© 2024 ${responseData?.heroName ?? ""}. All rights reserved.",
                    style: GoogleFonts.nunito(
                        fontSize: 12.spMin,
                        color: primaryColor,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 6.w, top: 6.h, bottom: 8.h),
                child: Row(
                  children: List.generate(
                    responseData?.socmed?.length ?? 0,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 2.w),
                      child: TextButton(
                          onPressed: () {
                            FirebaseAnalytic().logEvent("SOCMED_CLICKED");
                            // setState(() {
                            //   currentState = index;
                            // });
                            final Uri _url = Uri.parse(
                                responseData?.socmed?[index].value ?? '');
                            launchUrl(_url);
                          },
                          child: Container(
                            width: 10.dm,
                            height: 10.dm,
                            child: Image.network(
                              responseData?.socmed?[index].image ?? '',
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
