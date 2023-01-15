import 'dart:convert';

List<Userr> Users = <Userr>[];


class Userr {
  Userr({required this.name,required this.email,required this.pw,required this.mobile, this.uid});
  String name;
  String email;
  String pw;
  String mobile;
  String? uid;

Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'pw': pw,
      'mobile': mobile,
      'uid': uid
    };
  }

  factory Userr.fromMap(Map<String, dynamic> map) {
    return Userr(
      name: map['name'] ?? 'not specified',
      email: map['email'] ?? "not specified",
      pw: map['pw'] ?? '',
      mobile: map['mobile'] ?? "not specified",
      uid: map['uid'] ?? ""
    );
  }

  factory Userr.fromJson(String data) {
    // return   json.decode(data).cast<Todo>();
    return Userr.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
  
}
