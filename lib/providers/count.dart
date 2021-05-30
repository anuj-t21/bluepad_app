import 'package:flutter/material.dart';

class Count with ChangeNotifier {
  int likeCount = 0;
  int commentCount = 0;

  bool reachedMainScreenBottom = false;

  void toggleMainScreenBottomStatus(bool status) {
    reachedMainScreenBottom = status;
    notifyListeners();
  }

  void toggleComment(int count) {
    commentCount = commentCount == null ? 1 : (commentCount + 1);
    notifyListeners();
  }

  void toggleLike(int count) {
    likeCount = likeCount == null ? 1 : (likeCount + 1);
    notifyListeners();
  }
}
