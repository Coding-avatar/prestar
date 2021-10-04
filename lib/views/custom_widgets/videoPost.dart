import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:prestar/views/common_screens/CommentsScreen.dart';
import 'package:prestar/views/common_screens/LikesScreen.dart';

class VideoPost extends StatefulWidget {
  final String userName;
  final String lastActiveTime;
  final String numberOfViews;
  final String numberOfLikes;
  final String numberOfComments;
  final String videoTitle;
  final String videoDescription;
  final String videoUrl;
  final String videoThumbnail;

  const VideoPost({
    this.numberOfViews = "1.8k",
    this.userName = "Rima Dutta",
    this.lastActiveTime = "11:00 am",
    this.videoTitle = "Lorem ipsum",
    this.videoDescription =
        "Ln publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
    this.videoUrl = "https://brixhamtechnology.com/Content/media/video.mp4",
    this.videoThumbnail =
        "https://images.pexels.com/photos/9321606/pexels-photo-9321606.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200",
    this.numberOfLikes = "0",
    this.numberOfComments = "0",
  });

  @override
  _VideoPostState createState() => _VideoPostState();
}

enum Options {
  none,
  copy,
  unfollow,
  report,
}

class _VideoPostState extends State<VideoPost> {
  //Need a stream for like, comment, share
  bool _isLiked = false;
  bool _isShared = false;
  var _selection = Options.none;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${widget.userName} ',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'was live at ${widget.lastActiveTime} ',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              Expanded(child: SizedBox()),
              Text(
                '${widget.numberOfViews} ',
                style: TextStyle(color: Colors.black54, fontSize: 14),
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
          Container(
            width: double.infinity,
            child: Material(
              elevation: 10,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayer.network(
                    widget.videoUrl,
                    betterPlayerConfiguration: BetterPlayerConfiguration(
                      placeholder: Image.network(widget.videoThumbnail),
                      autoPlay: false,
                      controlsConfiguration:
                          BetterPlayerControlsConfiguration(enableMute: true),
                      aspectRatio: 16 / 9,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text(
              widget.videoTitle,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            widget.videoDescription,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w300),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                    child: Icon(
                      Icons.thumb_up,
                      color: _isLiked ? Colors.indigo : Colors.grey,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.numberOfLikes,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LikesScreen(
                          likes: [],
                        ),
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
                    builder: (context) => CommentsScreen(
                      comments: [],
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.comment_bank_outlined,
                      color: Colors.indigo,
                    ),
                    Text(
                      widget.numberOfComments,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      ' Comment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isShared = !_isShared;
                      });
                    },
                    child: Icon(
                      Icons.share,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    widget.numberOfLikes,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' Share',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
