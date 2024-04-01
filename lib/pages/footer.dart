import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entities/socmed_data.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<SocmedData> socmed = [
    SocmedData(
        id: 0,
        name: "Github",
        value: "https://github.com/rrahadis",
        image: "images/ic_footer_git.png"),
    SocmedData(
        id: 1,
        name: "LinkedIn",
        value: "https://www.linkedin.com/in/raden-rahadi-solehuddin/",
        image: "images/ic_footer_linkedin.png"),
    SocmedData(
        id: 2,
        name: "Instagram",
        value: "https://www.instagram.com/rrahadis/",
        image: "images/ic_footer_ig.png"),
    SocmedData(
        id: 3,
        name: "Twitter",
        value: "https://twitter.com/RahadiNoto",
        image: "images/ic_footer_twitter.png"),
  ];
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

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
                Uri waUrl = Uri.parse(
                    "https://wa.me/6285921688572?text=Hello,%20I'm%20interested");
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
                    "© 2024 Rahadi. All rights reserved.",
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
                    socmed.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 2.w),
                      child: TextButton(
                          onPressed: () {
                            // setState(() {
                            //   currentState = index;
                            // });
                            final Uri _url =
                                Uri.parse(socmed[index].value ?? '');
                            launchUrl(_url);
                          },
                          child: Container(
                            width: 10.dm,
                            height: 10.dm,
                            child: Image.asset(
                              socmed[index].image.toString(),
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
