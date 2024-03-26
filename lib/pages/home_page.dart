import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/socmed_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

  List<SocmedData> socmed = [
    SocmedData(
      id: 0,
      name: "Github",
      value: "https://github.com/rrahadis",
    ),
    SocmedData(
      id: 1,
      name: "LinkedIn",
      value: "https://www.linkedin.com/in/raden-rahadi-solehuddin/",
    ),
    SocmedData(
      id: 2,
      name: "Instagram",
      value: "https://www.instagram.com/rrahadis/",
    ),
    SocmedData(
      id: 3,
      name: "Twitter",
      value: "https://twitter.com/RahadiNoto",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin:
              EdgeInsets.only(left: 8.w, right: 8.w, top: 5.w, bottom: 20.w),
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30.w, right: 20.w),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: Color(0xFFCCF4BD),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle,
                              size: 10, color: const Color(0xFF42AE50)),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Available",
                            style: GoogleFonts.nunito(
                                fontSize: 5.sp,
                                color: const Color(0xFF42AE50),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 20.w, top: 10.w),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Hello! I'm Rahadi A ",
                              style: GoogleFonts.lexend(
                                  fontSize: 12.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: "Mobile Developer ",
                              style: GoogleFonts.lexend(
                                  fontSize: 12.sp,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                              text: "Based In Indonesia",
                              style: GoogleFonts.lexend(
                                  fontSize: 12.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 20.w, top: 5.w),
                    child: Text(
                      "From concept to execution, I've been crafting innovative mobile solutions tailored to diverse needs.",
                      style: GoogleFonts.nunito(
                          fontSize: 6.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 30.w, top: 5.w),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.h),
                          child: Text(
                            "View My Work",
                            style: GoogleFonts.nunito(
                                fontSize: 3.5.sp,
                                color: secondaryColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              side: BorderSide(color: secondaryColor),
                              borderRadius: BorderRadius.circular(5),
                            ))),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4.w, top: 5.w),
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
                                    fontSize: 3.5.sp,
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
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ))),
                        onPressed: () {},
                      ),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, right: 10.w, top: 5.w),
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
                              },
                              child: Container(
                                child: Text(
                                  socmed[index].name.toString(),
                                  style: GoogleFonts.nunito(
                                      fontSize: 3.5.sp,
                                      color: greyColor,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.start,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                child: Image.asset(
                  "images/profile.png",
                  height: 500.h,
                  // width: 80.w,
                  fit: BoxFit.fill,
                ),
                // margin: EdgeInsets.only(right: 60.w),
              )
            ],
          ),
        ));
  }
}
