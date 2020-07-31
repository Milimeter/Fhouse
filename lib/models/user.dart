class User {
  String uid;
  String email;
  String username;
  String jambReg;
  String password;

  User({this.uid, this.email, this.username, this.jambReg, this.password});

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['username'] = user.username;
    data['jambReg'] = user.jambReg;
    data['password'] = user.password;

    return data;
  }

  // Named constructor
  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.username = mapData['username'];
    this.jambReg = mapData['jambReg'];
    this.password = mapData['password'];
  }
}
