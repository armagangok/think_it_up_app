class PostModel {
  String userName = "";
  String comment = "";
  int likes = 0;
  int dislikes = 0;

  PostModel({
    required this.userName,
    required this.comment,
    required this.likes,
    required this.dislikes,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'comment': comment,
      'likes': likes,
      'dislikes': dislikes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] ?? '',
      comment: map['comment'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      dislikes: map['dislikes']?.toInt() ?? 0,
    );
  }
}
