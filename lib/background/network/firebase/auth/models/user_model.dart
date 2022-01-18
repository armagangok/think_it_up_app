class RenewedUser {
  String? id;
  String? email;
  String? userName;

  RenewedUser({
    required this.id,
    required this.email,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "userName": userName,
    };
  }
}
