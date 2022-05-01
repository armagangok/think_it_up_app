class AppUser {
  String? id;
  String? email;
  String? userName;
  String? password1;

  AppUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.password1,
  });

  set setID(String? uid) => id = uid;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
      "password": password1,
    };
  }
}
