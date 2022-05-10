class AppUser {
  String? id;
  String? email;
  String? userName;
  String? password;
  String? passwordRepeat;
  List<dynamic> likedPostsIDS;

  AppUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.password,
    this.passwordRepeat,
    required this.likedPostsIDS,
  });

  set setID(String? uid) => id = uid;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
      "password": password,
      "password2": passwordRepeat,
      "likedPosts": likedPostsIDS,
    };
  }
}
