import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../entities/skill_data.dart';
import '../entities/work_experience_data.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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

  List<SkillData> skillData = [
    SkillData(
        level: "Intermediate", name: "Flutter", image: "images/ic_flutter.png"),
    SkillData(
        level: "Intermediate", name: "Kotlin", image: "images/ic_kotlin.png"),
    SkillData(
        level: "Intermediate",
        name: "Firebase",
        image: "images/ic_firebase.png"),
    SkillData(level: "Beginer", name: "Golang", image: "images/ic_go.png"),
    SkillData(
        level: "Beginer",
        name: "Javascript",
        image: "images/ic_javascript.png"),
    SkillData(
        level: "Intermediate", name: "Github", image: "images/ic_github.png"),
    SkillData(
        level: "Beginer", name: "Bitbucket", image: "images/ic_bitbucket.png"),
    SkillData(
        level: "Beginer",
        name: "Confluence",
        image: "images/ic_confluence.png"),
    SkillData(level: "Intermediate", name: "Jira", image: "images/ic_jira.png"),
  ];

  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var lightGreyColor = const Color(0XFF2F2F2);
  var blackColor = const Color(0XFF000000);

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
                fontSize: 5.sp, color: greyColor, fontWeight: FontWeight.w400),
          ),
          Text(
            "Experience & Skill",
            style: GoogleFonts.nunito(
                fontSize: 10.sp,
                color: blackColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            height: 1,
            color: greyColor,
          ),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: dataExperiences.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 3),
                itemBuilder: (BuildContext context, int index) {
                  var dataExperience = dataExperiences[index];
                  return Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dataExperience.titleJob.toString(),
                              style: GoogleFonts.nunito(
                                  fontSize: 5.sp,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w700)),
                          Text(
                            dataExperience.experienceDate.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 4.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            dataExperience.company.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 4.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ));
                }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            height: 1,
            color: greyColor,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
