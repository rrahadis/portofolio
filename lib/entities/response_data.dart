import 'dart:convert';

import 'package:rrahadis_web/entities/socmed_data.dart';

ResponseData responseDataFromJson(String str) =>
    ResponseData.fromJson(jsonDecode(jsonEncode(str)));

class ResponseData {
  final String? description;
  final bool? isAvailable;
  final String? heroName;
  final String? heroJob;
  final String? heroCountry;
  final String? heroImgUrl;
  final List<SocmedData>? socmed;

  ResponseData({
    this.description,
    this.isAvailable,
    this.heroName,
    this.heroJob,
    this.heroCountry,
    this.heroImgUrl,
    this.socmed,
  });

  factory ResponseData.fromJson(Map<dynamic, dynamic> json) {
    return ResponseData(
      description: json['description'] == null ? null : json["description"],
      isAvailable: json['is_available'] == null ? true : json["is_available"],
      heroName: json['hero_name'] == null ? null : json["hero_name"],
      heroJob: json['hero_job'] == null ? null : json["hero_job"],
      heroCountry: json['hero_country'] == null ? null : json["hero_country"],
      heroImgUrl: json['hero_img_url'] == null ? null : json["hero_img_url"],
      socmed: json["socmed"] == null
          ? null
          : List<SocmedData>.from(
              json["socmed"].map((x) => SocmedData.fromJson(x))),
    );
  }
}
