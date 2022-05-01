class PostModel {
  String? userName;
  String? comment;
  int? likeNumber;
  
  PostModel({
    this.userName,
    this.comment,
    this.likeNumber,
  });

  PostModel copyWith({
    String? userName,
    String? comment,
    int? likeNumber,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      comment: comment ?? this.comment,
      likeNumber: likeNumber ?? this.likeNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'comment': comment,
      'likeNumber': likeNumber,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'],
      comment: map['comment'],
      likeNumber: map['likeNumber']?.toInt(),
    );
  }
}
