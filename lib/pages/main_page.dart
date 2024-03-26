import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/menu.dart';
import 'package:rrahadis_web/pages/home_page.dart';
import 'package:rrahadis_web/pages/work_page.dart';

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

  List<Menu> menuData = [
    Menu(id: 0, name: "Home"),
    Menu(id: 1, name: "Work"),
    Menu(id: 2, name: "About"),
    Menu(id: 3, name: "Experience"),
    Menu(id: 4, name: "Skill"),
  ];

  var currentState = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/raden_logo.png",
                    height: 25.h,
                    width: 20.w,
                    fit: BoxFit.fill,
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ))),
                      onPressed: () {},
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
            )),
        body: Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [HomePage(), WorkPage()],
              ),
            )),
          ],
        ));
  }

  Text checkCurrentNavigation(int idx) {
    if (currentState == menuData[idx].id) {
      return Text(
        menuData[idx].name.toString(),
        style: GoogleFonts.nunito(
            fontSize: 4.sp, color: Colors.black, fontWeight: FontWeight.w700),
      );
    } else {
      return Text(
        menuData[idx].name.toString(),
        style: GoogleFonts.nunito(
            fontSize: 4.sp, color: greyColor, fontWeight: FontWeight.w700),
      );
    }
  }
}