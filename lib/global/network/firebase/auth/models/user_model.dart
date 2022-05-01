class RenewedUser {
  String? id;
  String? email;
  String? userName;
  List? comment;

  RenewedUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
      "comment": comment,
    };
  }
}
