class ImagePostInfo {
  final String userName;
  final String imageTitle;
  final String imageDescription;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfShares;
  final String imageUrl;

  ImagePostInfo(
      {this.userName = 'User Name',
      this.imageTitle = 'Video Title',
      this.imageDescription = 'This is a short video description',
      this.numberOfLikes = "0",
      required this.imageUrl,
      this.numberOfComments = "0",
      this.numberOfShares = "0"});
}
