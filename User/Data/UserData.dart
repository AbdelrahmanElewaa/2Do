
List<User> Users = <User>[
];
void addUserData({required String name, }) {
  // setState(() {
  Users.add(User(name: name));
  // }
  // );
  // _textFieldController.clear();
}
class User {
  User({required this.name});
  String name;
 






  @override
  String toString() =>"name: $name";
}