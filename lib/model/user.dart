class User {
  String? name;
  String? email;
  String? age;
  String? uid;

  User({this.name, this.email, this.age, this.uid});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    return data;
  }
}
