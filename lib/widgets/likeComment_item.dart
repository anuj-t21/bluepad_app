import 'package:bluepad_app/providers/count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Action {
  Like,
  Comment,
}

class LikeCommentItem extends StatelessWidget {
  Widget _buildCountShowWidget(String count, action) => Column(
        children: <Widget>[
          Text(
            count,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          action == Action.Like ? Text('Likes') : Text('Comments'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Count>(context);
    return Container(
      margin: const EdgeInsets.only(
        left: 6,
        right: 6,
        top: 6,
        bottom: 30,
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCountShowWidget(data.likeCount.toString(), Action.Like),
                VerticalDivider(
                  color: Theme.of(context).primaryColor,
                ),
                _buildCountShowWidget(
                    data.commentCount.toString(), Action.Comment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
