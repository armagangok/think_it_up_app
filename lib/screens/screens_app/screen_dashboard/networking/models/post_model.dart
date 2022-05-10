class PostModel {
  String userName;
  String comment;
  String postID;
  int likes;
  bool isLiked;
  PostModel({
    required this.userName,
    required this.comment,
    required this.postID,
    required this.likes,
    this.isLiked = false,
  });

  PostModel copyWith({
    String? userName,
    String? comment,
    String? postID,
    int? likes,
    bool? isLiked,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      comment: comment ?? this.comment,
      postID: postID ?? this.postID,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'comment': comment,
      'postID': postID,
      'likes': likes,
      'isLiked': isLiked,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] ?? '',
      comment: map['comment'] ?? '',
      postID: map['postID'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      isLiked: map['isLiked'] ?? false,
    );
  }
}
