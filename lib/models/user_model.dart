class User {
  String? uid;
  String? email;
  String? name;
  String? about;
  String? imgUrl;
  String? type;

  User({this.uid, this.email, this.name, this.about, this.imgUrl, this.type});

  User.fromJson(Map<String, dynamic> json) {
    if (json["uid"] is String) {
      uid = json["uid"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["about"] is String) {
      about = json["about"];
    }
    if (json["img_url"] is String) {
      imgUrl = json["img_url"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uid"] = uid;
    data["email"] = email;
    data["name"] = name;
    data["about"] = about;
    data["img_url"] = imgUrl;
    data["type"] = type;
    return data;
  }
}
