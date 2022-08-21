class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? link;
  // String? secondName;

  UserModel({this.uid, this.email, this.fullName, this.link});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      link: map['link']
      // secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': fullName,
      'link': link,
      // 'secondName': secondName,
    };
  }
}