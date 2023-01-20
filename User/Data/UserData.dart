import 'dart:convert';

List<Userr> Users = <Userr>[];


class Userr {
  Userr({required this.name,required this.email,required this.pw,required this.dob, this.uid,required this.profileURL});
  String name;
  String email;
  String pw;
  String dob;
  String? uid;
  String profileURL;

Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'pw': pw,
      'dob': dob,
      'uid': uid,
      'profileURL':profileURL
    };
  }

  factory Userr.fromMap(Map<String, dynamic> map) {
    return Userr(
      name: map['name'] ?? 'not specified',
      email: map['email'] ?? "not specified",
      pw: map['pw'] ?? '',
      dob: map['dob'] ?? "not specified",
      uid: map['uid'] ?? "",
      profileURL: map['profileURL']??''
    );
  }

  factory Userr.fromJson(String data) {
    // return   json.decode(data).cast<Todo>();
    return Userr.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
  
}
