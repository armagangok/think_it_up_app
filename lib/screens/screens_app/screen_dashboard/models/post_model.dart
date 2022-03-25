import 'dart:convert';

import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  String? userName;
  String? comment;
  int? likes;
  bool isLiked;

  PostModel({
    this.userName = "",
    this.comment = "",
    this.likes = 0,
    this.isLiked = false,
  });

  void isLikedChange() {
    print(isLiked);
    isLiked = !isLiked;
    notifyListeners();
  }

  PostModel copyWith({
    String? userName,
    String? comment,
    int? likes,
    bool? isLiked,
  }) {
    return PostModel(
      userName: userName ?? this.userName,
      comment: comment ?? this.comment,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'comment': comment,
      'likes': likes,
      'isLiked': isLiked,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userName: map['userName'] ?? '',
      comment: map['comment'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      isLiked: map['isLiked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(userName: $userName, comment: $comment, likes: $likes, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.userName == userName &&
        other.comment == comment &&
        other.likes == likes &&
        other.isLiked == isLiked;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        comment.hashCode ^
        likes.hashCode ^
        isLiked.hashCode;
  }
}
