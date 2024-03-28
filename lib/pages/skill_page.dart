import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../entities/skill_data.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
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
          Container(
            padding: EdgeInsets.all(5.dg),
            margin: EdgeInsets.all(5.dg),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(40),
            ),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: skillData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 4.w,
                    childAspectRatio: 3),
                itemBuilder: (BuildContext context, int index) {
                  var dataSkill = skillData[index];
                  return Container(
                      padding: EdgeInsets.all(5.dg),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(40),
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
                              Text(dataSkill.level.toString(),
                                  style: GoogleFonts.nunito(
                                      fontSize: 4.sp,
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                dataSkill.name.toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 5.sp,
                                    color: blackColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )),
                          Container(
                            // margin: EdgeInsets.only(
                            //     top: 10.w, left: 10.w, right: 10.w),
                            child: Image.asset(
                              dataSkill.image.toString(),
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
