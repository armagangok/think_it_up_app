class RenewedUser {
  String? id;
  String? email;
  String? userName;
  String? ppURL;
  DateTime? createdAt;
  DateTime? updatedAt;

  RenewedUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.ppURL,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id ?? "",
      "email": email ?? "",
      "userName": userName ?? "",
      "ppURL": ppURL,
      "createTime": createdAt ?? "",
      "updateTime": updatedAt ?? "",
    };
  }
}
