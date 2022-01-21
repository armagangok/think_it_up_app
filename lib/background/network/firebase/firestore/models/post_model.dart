
class PostModel {
  String userName = "";
  String comment = "";
  int like = 0;
  int dislike = 0;

  PostModel({
    required this.userName,
    required this.comment,
    required this.like,
    required this.dislike,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'comment': comment,
      'like': like,
      'dislike': dislike,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['username'] ?? '',
      comment: map['comment'] ?? '',
      like: map['like']?.toInt() ?? 0,
      dislike: map['dislike']?.toInt() ?? 0,
    );
  }
}
