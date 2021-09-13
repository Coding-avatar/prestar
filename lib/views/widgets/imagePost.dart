import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prestar/views/screens/CommentsScreen.dart';
import 'package:prestar/views/screens/LikesScreen.dart';

class ImagePost extends StatefulWidget {
  final String userName;
  final String postTime;
  final String imageDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String imageUrl;
  const ImagePost(
      {Key? key,
      this.userName = "User Name",
      this.postTime = "1 min ago",
      this.imageDescription = "This is a small image description",
      this.numberOfLikes = "0",
      this.numberOfComments = "0",
      this.numberOfShares = "0",
      required this.imageUrl})
      : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

enum Options {
  none,
  copy,
  unfollow,
  report,
}

class _ImagePostState extends State<ImagePost> {
  bool _isLiked = false;
  bool _isShared = false;
  var _selection = Options.none;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Posted ${widget.postTime}',
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),
                    ],
                  ),
                  Text(widget.imageDescription),
                ],
              ),
              PopupMenuButton<Options>(
                padding: EdgeInsets.all(0),
                iconSize: 20,
                onSelected: (Options result) {
                  setState(() {
                    _selection = result;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Options>>[
                  const PopupMenuItem<Options>(
                    value: Options.copy,
                    child: Text('Copy Post'),
                  ),
                  const PopupMenuItem<Options>(
                    value: Options.unfollow,
                    child: Text('Unfollow'),
                  ),
                  const PopupMenuItem<Options>(
                    value: Options.report,
                    child: Text('Report Problem'),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      color: _isLiked ? Colors.indigo : Colors.grey,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.numberOfLikes),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LikesScreen(),
                      ),
                    ),
                    child: Text(
                      ' Like',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.comment_bank_outlined,
                      color: Colors.indigo,
                    ),
                    Text(widget.numberOfComments),
                    Text(' Comment')
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _isShared = !_isShared;
                      });
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(widget.numberOfLikes),
                  Text(' Share')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
