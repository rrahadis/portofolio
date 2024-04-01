import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/core/device_size.dart';
import 'package:rrahadis_web/entities/menu.dart';
import 'package:rrahadis_web/pages/about_page.dart';
import 'package:rrahadis_web/pages/experience_page.dart';
import 'package:rrahadis_web/pages/footer.dart';
import 'package:rrahadis_web/pages/home_page.dart';
import 'package:rrahadis_web/pages/skill_page.dart';
import 'package:rrahadis_web/pages/work_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

  final homeKey = new GlobalKey();
  final workKey = new GlobalKey();
  final aboutKey = new GlobalKey();
  final experienceKey = new GlobalKey();
  final skillKey = new GlobalKey();

  List<Menu> menuData = [
    Menu(id: 0, name: "Home"),
    Menu(id: 1, name: "Work"),
    Menu(id: 2, name: "About"),
    Menu(id: 3, name: "Experience"),
    Menu(id: 4, name: "Skill"),
  ];

  var currentState = 0;
  final ScrollController _controller = ScrollController();
  bool isExpandedMenu = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initListenerScrollForNavigation();
    });
    super.initState();
  }

  void _initListenerScrollForNavigation() {
    double homeHeight = homeKey.currentContext!.size!.height;
    double workHeight = workKey.currentContext!.size!.height;
    double aboutHeight = aboutKey.currentContext!.size!.height;
    double experienceHeight = experienceKey.currentContext!.size!.height;
    double skillHeight = skillKey.currentContext!.size!.height;

    _controller.addListener(() {
      double controllerHeight = _controller.offset;

      if (controllerHeight < homeHeight) {
        setState(() {
          currentState = 0;
        });
      } else if (controllerHeight < (homeHeight + workHeight)) {
        setState(() {
          currentState = 1;
        });
      } else if (controllerHeight < (homeHeight + workHeight + aboutHeight)) {
        setState(() {
          currentState = 2;
        });
      } else if (controllerHeight <
          (homeHeight + workHeight + aboutHeight + experienceHeight)) {
        setState(() {
          currentState = 3;
        });
      } else if (controllerHeight <
          (homeHeight +
              workHeight +
              aboutHeight +
              experienceHeight +
              skillHeight)) {
        setState(() {
          currentState = 4;
        });
      }
    });
  }

  Widget appBar(BuildContext context) {
    if (DeviceSize().isSmallScreen(context)) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "images/raden_logo.png",
              // height: 25.h,
              width: 70.w,
              fit: BoxFit.fill,
            ),
            if (!isExpandedMenu) ...[
              InkWell(
                  onTap: () {
                    setState(() {
                      isExpandedMenu = true;
                    });
                  },
                  child: Icon(Icons.menu, color: Colors.grey))
            ] else ...[
              InkWell(
                  onTap: () {
                    setState(() {
                      isExpandedMenu = false;
                    });
                  },
                  child: Icon(Icons.close, color: Colors.grey))
            ]
          ],
        ),
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
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "images/raden_logo.png",
              // height: 25.h,
              width: 30.w,
              // fit: BoxFit,
            ),
            Row(
              children: List.generate(
                menuData.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          currentState = index;
                        });

                        switch (menuData[index].id) {
                          case 0:
                            Scrollable.ensureVisible(
                                homeKey.currentContext ?? context,
                                duration: Duration(milliseconds: 500));
                            break;
                          case 1:
                            Scrollable.ensureVisible(
                                workKey.currentContext ?? context,
                                duration: Duration(milliseconds: 500));
                            break;
                          case 2:
                            Scrollable.ensureVisible(
                                aboutKey.currentContext ?? context,
                                duration: Duration(milliseconds: 500));
                            break;
                          case 3:
                            Scrollable.ensureVisible(
                                experienceKey.currentContext ?? context,
                                duration: Duration(milliseconds: 500));
                            break;
                          case 4:
                            Scrollable.ensureVisible(
                                skillKey.currentContext ?? context,
                                duration: Duration(milliseconds: 500));
                            break;
                        }
                      },
                      child: checkCurrentNavigation(index)),
                ),
              ),
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
                            fontSize: 13.spMin,
                            color: primaryColor,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 5.w,
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
          ],
        ),
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: appBar(context)),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        key: homeKey,
                        child: HomePage(
                            onTap: () => Scrollable.ensureVisible(
                                workKey.currentContext ?? context)),
                      ),
                      Container(
                        key: workKey,
                        child: WorkPage(),
                      ),
                      Container(
                        key: aboutKey,
                        child: AboutPage(),
                      ),
                      Container(
                        key: experienceKey,
                        child: ExperiencePage(),
                      ),
                      Container(
                        key: skillKey,
                        child: SkillPage(),
                      ),
                      Footer()
                    ],
                  ),
                )),
              ],
            ),
            if (isExpandedMenu) ...[ExpandedMenu()]
          ],
        ));
  }

  Widget ExpandedMenu() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(3.dg),
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    menuData.length,
                    (index) => Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  currentState = index;
                                });

                                switch (menuData[index].id) {
                                  case 0:
                                    Scrollable.ensureVisible(
                                        homeKey.currentContext ?? context,
                                        duration: Duration(milliseconds: 500));
                                    break;
                                  case 1:
                                    Scrollable.ensureVisible(
                                        workKey.currentContext ?? context,
                                        duration: Duration(milliseconds: 500));
                                    break;
                                  case 2:
                                    Scrollable.ensureVisible(
                                        aboutKey.currentContext ?? context,
                                        duration: Duration(milliseconds: 500));
                                    break;
                                  case 3:
                                    Scrollable.ensureVisible(
                                        experienceKey.currentContext ?? context,
                                        duration: Duration(milliseconds: 500));
                                    break;
                                  case 4:
                                    Scrollable.ensureVisible(
                                        skillKey.currentContext ?? context,
                                        duration: Duration(milliseconds: 500));
                                    break;
                                }
                              },
                              child: Text(
                                menuData[index].name.toString(),
                                style: GoogleFonts.nunito(
                                    fontSize: 12.sp,
                                    color: greyColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )))),
          ),
        )
      ],
    );
  }

  Text checkCurrentNavigation(int idx) {
    if (currentState == menuData[idx].id) {
      return Text(
        menuData[idx].name.toString(),
        style: GoogleFonts.nunito(
            fontSize: 14.spMin,
            color: Colors.black,
            fontWeight: FontWeight.w900),
      );
    } else {
      return Text(
        menuData[idx].name.toString(),
        style: GoogleFonts.nunito(
            fontSize: 14.spMin, color: greyColor, fontWeight: FontWeight.w700),
      );
    }
  }
}
