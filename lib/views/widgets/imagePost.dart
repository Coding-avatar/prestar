import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePost extends StatefulWidget {
  final String userName;
  final String imageTitle;
  final String imageDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String imageUrl;
  const ImagePost(
      {Key? key,
      this.userName = "User Name",
      this.imageTitle = "Image title",
      this.imageDescription = "This is a small image description",
      this.numberOfLikes = "0",
      this.numberOfComments = "0",
      this.numberOfShares = "0",
      required this.imageUrl})
      : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  bool _isLiked = false;
  bool _isCommented = false;
  bool _isShared = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.userName,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(widget.imageUrl),
            ),
          ),
          Text(widget.imageTitle),
          Text(widget.imageDescription),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      color: _isLiked ? Colors.indigo : Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.numberOfLikes),
                  Text(' Like')
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isCommented = !_isCommented;
                      });
                    },
                    icon: Icon(
                      Icons.comment_bank_outlined,
                      color: _isCommented ? Colors.indigo : Colors.grey,
                    ),
                  ),
                  Text(widget.numberOfComments),
                  Text(' Comment')
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isShared = !_isShared;
                      });
                    },
                    icon: Icon(
                      Icons.share,
                      color: _isShared ? Colors.indigo : Colors.grey,
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
