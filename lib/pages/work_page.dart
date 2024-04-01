import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/device_size.dart';
import '../entities/project_data.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  List<String> skillData = [
    "images/ic_skill_android.png",
    "images/ic_skill_flutter.png",
    "images/ic_skill_kotlin.png",
    "images/ic_skill_firebase.png",
    "images/ic_skill_github.png",
    "images/ic_skill_bitbucket.png",
    "images/ic_skill_jira.png",
    "images/ic_skill_counfluence.png"
  ];

  List<ProjectData> projectData = [
    ProjectData(
        isFeatured: true,
        icon: "images/ic_octo.png",
        name: "Octo Mobile V1",
        role: "Frontend Developer",
        desc:
            "Mobile Banking App and handle several features like search menu, Development customer preferred and Insurance with Kony JS.",
        image: "images/img_octo_v1.png",
        isHover: false,
        url:
            "https://play.google.com/store/apps/details?id=id.co.cimbniaga.mobile.android"),
    ProjectData(
        isFeatured: true,
        icon: "images/ic_octo.png",
        name: "Octo Mobile V2",
        role: "Frontend Developer",
        desc:
            "Mobile Banking App and handle several features like Bill payment, Travel Concierge and M-Pin. Development with Kotlin and Architecture Pattern VIPER.",
        image: "images/img_octo_v2.png",
        isHover: false,
        url:
            "https://play.google.com/store/apps/details?id=id.co.cimbniaga.mobile.android"),
    ProjectData(
        isFeatured: true,
        icon: "images/ic_prodia.png",
        name: "Prodia For Doctor",
        role: "Mobile Developer",
        desc:
            "Development several features like special offer, order services, and enhancement UI and maintenance an app. Development with Flutter and BLOC State Management.",
        image: "images/img_pfd.png",
        isHover: false,
        url: "https://play.google.com/store/apps/details?id=id.prodia.doctor"),
    ProjectData(
        isFeatured: true,
        icon: "images/ic_prodia.png",
        name: "Prodia Mobile",
        role: "Mobile Developer",
        desc:
            "Development several features like chat system, and enhancement UI and maintenance an app. Development with Kotlin and Clean Architecture also Architecture Pattern MVVM.",
        image: "images/img_pm.png",
        isHover: false,
        url:
            "https://play.google.com/store/apps/details?id=com.prodia.mobileandroid"),
    ProjectData(
        isFeatured: false,
        icon: "images/ic_prodia.png",
        name: "Ethos Mobile",
        role: "Mobile Developer",
        desc:
            "Development officer Android app for take an order, tracking an officer with google maps direction and chat system. Development with Kotlin and Clean Architecture also Architecture Pattern MVVM.",
        image: "images/img_ethos.png",
        isHover: false,
        url:
            "https://play.google.com/store/apps/details?id=com.prodia.prodiahomeservicev2"),
    ProjectData(
        isFeatured: false,
        icon: "images/ic_bni.png",
        name: "Xpora BNI MVP 2",
        role: "Frontend Developer",
        desc:
            "Development several features BCU, Inspiration and on boarding, Development with Vue JS",
        image: "images/img_xpora.png",
        isHover: false,
        url: "https://xpora.bni.co.id/"),
  ];
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
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

  double MarginHorizontalItemAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 6.w;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 10.w;
    } else {
      return 25.w;
    }
  }

  double IconSizeAdapter() {
    if (DeviceSize().isLargeScreen(context)) {
      return 9.dm;
    } else if (DeviceSize().isMediumScreen(context)) {
      return 12.dm;
    } else {
      return 20.dm;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            height: 60.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: skillData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20.h,
                              child: Image.asset(
                                skillData[index],
                                // fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            if (index != skillData.length - 1) ...[
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: greyColor,
                              ),
                            ],
                            SizedBox(width: 8.w),
                          ],
                        ));
                  }),
            )),
        SizedBox(
          height: 20.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: GridView.builder(
            // primary: true,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projectData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: GridViewAdapter(),
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 4.w,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              var data = projectData[index];
              return InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  Uri value = Uri.parse(data.url.toString());
                  launchUrl(value);
                },
                onHover: (value) {
                  setState(() {
                    data.isHover = value;
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: data.isHover == true
                          ? Colors.grey.shade200
                          : primaryColor,
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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (data.isFeatured == true) ...[
                          Container(
                              margin: EdgeInsets.only(
                                  left: MarginHorizontalItemAdapter(),
                                  right: MarginHorizontalItemAdapter(),
                                  top: 10.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: Color(0xFFFDF3F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: secondaryColor),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "Featured",
                                    style: GoogleFonts.nunito(
                                        fontSize: 13.spMin,
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ] else ...[
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                        Container(
                          width: IconSizeAdapter(),
                          height: IconSizeAdapter(),
                          margin: EdgeInsets.only(
                              left: MarginHorizontalItemAdapter(),
                              right: MarginHorizontalItemAdapter(),
                              top: 10.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greyColor,
                            // borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Image.asset(
                            data.icon ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MarginHorizontalItemAdapter(),
                              right: MarginHorizontalItemAdapter(),
                              top: 10.h),
                          child: Text(
                            data.name.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 18.spMin,
                                color: blackColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MarginHorizontalItemAdapter(),
                              right: MarginHorizontalItemAdapter(),
                              top: 5.h),
                          child: Text(
                            "As ${data.role.toString()}",
                            style: GoogleFonts.nunito(
                                fontSize: 15.spMin,
                                color: secondaryColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MarginHorizontalItemAdapter(),
                              right: MarginHorizontalItemAdapter(),
                              top: 5.h),
                          child: Text(
                            data.desc.toString(),
                            style: GoogleFonts.nunito(
                                fontSize: 16.spMin,
                                color: greyColor,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        if (DeviceSize().isLargeScreen(context)) ...[
                          SizedBox(
                            height: 45.h,
                          ),
                        ],
                        Expanded(
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 15.h),
                              child: Image.asset(
                                data.image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
