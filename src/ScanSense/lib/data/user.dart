class User {
  String? name;
  String? email;
  String? photo;
  String? phone;

  User({this.name, this.email, this.photo, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    data['phone'] = phone;
    return data;
  }
}
