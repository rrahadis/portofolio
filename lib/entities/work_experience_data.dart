class WorkExperienceData {
  WorkExperienceData({
    this.titleJob,
    this.company,
    this.experienceDate,
    this.description,
  });

  String? titleJob;
  String? company;
  String? experienceDate;
  String? description;

  factory WorkExperienceData.fromJson(Map<dynamic, dynamic> json) {
    return WorkExperienceData(
        titleJob: json['title_job'] == null ? null : json["title_job"],
        company: json['company'] == null ? null : json["company"],
        experienceDate:
            json['experience_date'] == null ? null : json["experience_date"],
        description: json['description'] == null ? null : json["description"]);
  }
}
