import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/work_experience_data.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<WorkExperienceData> dataExperiences = [
    WorkExperienceData(
      titleJob: "Laboratory Assistant",
      company: "Gunadarma University",
      experienceDate: "February 2018 - October 2020",
      description:
          "Have experience as laboratory assistant handle management and maintenance electronics component, and assistant a lecture to teach about electronics and embedded systems.",
    ),
    WorkExperienceData(
      titleJob: "Frontend Developer",
      company: "PT Infosys Solusi Terpadu",
      experienceDate: "October 2020 - April 2022",
      description:
          "Have experience developement an application using native (kotlin) with Architecture Pattern VIPER and experience development an application using Kony JS, and development web app using Vue JS.",
    ),
    WorkExperienceData(
      titleJob: "Mobile Developer",
      company: "PT Prodia Widyahusada Tbk",
      experienceDate: "April 2022 - Present",
      description:
          "Have experience development and maintained an application using kotlin with clean architecture MVVM and Flutter.",
    )
  ];
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              decoration: BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 25.w,
                  color: secondaryColor,
                ),
                SizedBox(width: 5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gunadarma University",
                      style: GoogleFonts.lexend(
                          fontSize: 8.sp, color: secondaryColor),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Major Computer System, GPA 3.62 of 4.00",
                      style:
                          GoogleFonts.lexend(fontSize: 5.sp, color: blackColor),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "experience as the lead of scholarship students and lead of laboratory assistant.",
                      style: GoogleFonts.lexend(
                          fontSize: 5.sp, color: secondaryColor),
                      textAlign: TextAlign.start,
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w, top: 40.h),
              child: Text(
                "what work experience does Hadi have?",
                style: GoogleFonts.lexend(fontSize: 12.sp, color: blackColor),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    dataExperiences.length,
                    (index) => Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: secondaryColor, width: 3.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: secondaryColor,
                          elevation: 0,
                          child: Container(
                              padding: EdgeInsetsDirectional.all(30),
                              height: 300.h,
                              width: 100.w,
                              child: Column(
                                children: [
                                  Text(
                                    dataExperiences[index].titleJob ?? '',
                                    style: GoogleFonts.lexend(
                                        fontSize: 8.sp, color: blackColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    dataExperiences[index].company ?? '',
                                    style: GoogleFonts.lexend(
                                        fontSize: 6.sp, color: blackColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    dataExperiences[index].experienceDate ?? '',
                                    style: GoogleFonts.lexend(
                                        fontSize: 4.sp, color: blackColor),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    dataExperiences[index].description ?? '',
                                    style: GoogleFonts.lexend(
                                        fontSize: 4.sp, color: blackColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        )))

            // ListView.builder(
            //     scrollDirection: Axis.vertical,
            //     itemCount: 3,
            //     itemBuilder: (context, int index) {
            //       return Text("data");
            //     })
          ],
        ));
  }
}
