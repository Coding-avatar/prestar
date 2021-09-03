import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final String userName;
  final String lastActiveTime;
  final String numberOfViews;
  final String videoTitle;
  final String videoDescription;
  final String videoUrl;

  const VideoPost({
    this.numberOfViews = "1.8k",
    this.userName = "Rima Dutta",
    this.lastActiveTime = "11:00 am",
    this.videoTitle = "Lorem ipsum",
    this.videoDescription =
        "Ln publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
    this.videoUrl = "https://brixhamtechnology.com/Content/media/video.mp4",
  });

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  //Need a stream for like, comment, share
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${widget.userName} ',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'was live at ${widget.lastActiveTime} ',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              Expanded(child: SizedBox()),
              Text(
                '${widget.numberOfViews} ',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              Icon(Icons.more_horiz),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: _controller.value.isInitialized
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : Container(),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            widget.videoDescription,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w300),
          ),
          Divider(),
        ],
      ),
    );
  }
}
