class SocmedData {
  final int? id;
  final String? name;
  final String? image;
  final String? value;

  SocmedData({
    required this.id,
    required this.name,
    this.image,
    required this.value,
  });

  factory SocmedData.fromJson(Map<dynamic, dynamic> json) {
    return SocmedData(
      id: json['id'] == null ? null : json["id"],
      name: json['name'] == null ? null : json["name"],
      image: json['image'] == null ? null : json["image"],
      value: json['value'] == null ? null : json["value"],
    );
  }
}
