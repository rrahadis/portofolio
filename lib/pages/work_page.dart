import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrahadis_web/entities/response_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/device_size.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  var primaryColor = const Color(0xFFFCFCFC);
  var secondaryColor = const Color(0XFFE84D35);
  var greyColor = const Color(0XFF797979);
  var blackColor = const Color(0XFF000000);

  ResponseData? responseData = null;

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
                  itemCount: responseData?.skillIcon?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20.h,
                              child: Image.network(
                                responseData?.skillIcon?[index] ?? '',
                                // fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            if (responseData != null &&
                                responseData!.skillIcon != null &&
                                index !=
                                    responseData!.skillIcon!.length - 1) ...[
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
            itemCount: responseData?.projects?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: GridViewAdapter(),
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 4.w,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              var data = responseData?.projects?[index];
              return InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  Uri value = Uri.parse(data?.url ?? '');
                  launchUrl(value);
                },
                onHover: (value) {
                  setState(() {
                    data?.isHover = value;
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: data?.isHover == true
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
                        if (data?.isFeatured == true) ...[
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
                          child: Image.network(
                            data?.icon ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MarginHorizontalItemAdapter(),
                              right: MarginHorizontalItemAdapter(),
                              top: 10.h),
                          child: Text(
                            data?.name ?? "",
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
                            "As ${data?.role.toString()}",
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
                            data?.desc ?? "",
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
                              child: Image.network(
                                data?.image ?? "",
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
