import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  String userName;
  String comment;
  String postID;
  int likes;

  PostModel({
    required this.userName,
    required this.comment,
    required this.postID,
    required this.likes,
  });

  PostModel copyWith({
    String? userName,
    String? comment,
    String? postID,
    int? likes,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      comment: comment ?? this.comment,
      postID: postID ?? this.postID,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'comment': comment,
      'postID': postID,
      'likes': likes,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] ?? '',
      comment: map['comment'] ?? '',
      postID: map['postID'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
    );
  }
}
