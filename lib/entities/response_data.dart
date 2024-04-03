import 'dart:convert';

import 'package:rrahadis_web/entities/project_data.dart';
import 'package:rrahadis_web/entities/skill_data.dart';
import 'package:rrahadis_web/entities/socmed_data.dart';
import 'package:rrahadis_web/entities/work_experience_data.dart';

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
  final List<String>? skillIcon;
  final List<ProjectData>? projects;
  final String? howTo;
  final String? purpose;
  final String? heroPhoneNumber;
  final List<WorkExperienceData>? experiences;
  final List<SkillData>? skillData;

  ResponseData(
      {this.description,
      this.isAvailable,
      this.heroName,
      this.heroJob,
      this.heroCountry,
      this.heroImgUrl,
      this.socmed,
      this.skillIcon,
      this.projects,
      this.howTo,
      this.purpose,
      this.heroPhoneNumber,
      this.experiences,
      this.skillData});

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
      skillIcon: json["skill_icon"] == null
          ? null
          : List<String>.from(json["skill_icon"].map((x) => x)),
      projects: json["projects"] == null
          ? null
          : List<ProjectData>.from(
              json["projects"].map((x) => ProjectData.fromJson(x))),
      howTo: json['how_to'] == null ? null : json["how_to"],
      purpose: json['purpose'] == null ? null : json["purpose"],
      heroPhoneNumber:
          json['hero_phone_number'] == null ? null : json["hero_phone_number"],
      experiences: json["experiences"] == null
          ? null
          : List<WorkExperienceData>.from(
              json["experiences"].map((x) => WorkExperienceData.fromJson(x))),
      skillData: json["skills"] == null
          ? null
          : List<SkillData>.from(
              json["skills"].map((x) => SkillData.fromJson(x))),
    );
  }
}
