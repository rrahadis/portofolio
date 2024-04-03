class ProjectData {
  ProjectData(
      {this.isFeatured,
      this.icon,
      this.name,
      this.role,
      this.desc,
      this.image,
      this.url,
      this.isHover});

  bool? isFeatured;
  String? icon;
  String? name;
  String? role;
  String? desc;
  String? image;
  String? url;
  bool? isHover;

  factory ProjectData.fromJson(Map<dynamic, dynamic> json) {
    return ProjectData(
      isFeatured: json['is_featured'] == null ? false : json["is_featured"],
      icon: json['icon'] == null ? null : json["icon"],
      name: json['name'] == null ? null : json["name"],
      role: json['role'] == null ? null : json["role"],
      desc: json['desc'] == null ? null : json["desc"],
      image: json['image'] == null ? null : json["image"],
      url: json['url'] == null ? null : json["url"],
    );
  }
}
