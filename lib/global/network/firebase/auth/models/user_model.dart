class AppUser {
  String? id;
  String? email;
  String? userName;
  String? password;
  String? password2;

  AppUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.password,
     this.password2,
    
  });

  set setID(String? uid) => id = uid;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
      "password": password,
      "password2": password2,
    };
  }
}

