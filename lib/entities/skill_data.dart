class SkillData {
  SkillData({
    this.level,
    this.name,
    this.image,
  });

  String? level;
  String? name;
  String? image;

  factory SkillData.fromJson(Map<dynamic, dynamic> json) {
    return SkillData(
      level: json['level'] == null ? null : json["level"],
      name: json['name'] == null ? null : json["name"],
      image: json['images'] == null ? null : json["images"],
    );
  }
}
