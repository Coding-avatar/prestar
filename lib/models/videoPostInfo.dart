class VideoPostInfo {
  final String userName;
  final String videoTitle;
  final String videoDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String videoUrl;

  VideoPostInfo(
      {this.userName = 'User Name',
      this.videoTitle = 'Video Title',
      this.videoDescription = 'This is a short video description',
      this.numberOfLikes = "0",
      required this.videoUrl,
      this.numberOfComments = "0",
      this.numberOfShares = "0"});
}
