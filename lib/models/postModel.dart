class Post {
  final String postID;
  final String userId;
  final String userName;
  final String postTitle;
  final String postType;
  final String? postDescription;
  final DateTime createdTime;
  final String postMedia;
  final List<String>? postLikes;
  final List postComments;
  final String filter;

  Post(
      this.postID,
      this.userId,
      this.userName,
      this.postTitle,
      this.postType,
      this.postDescription,
      this.createdTime,
      this.postMedia,
      this.postLikes,
      this.postComments,
      this.filter);
}

class Comments {
  final String userId;
  final String comment;

  Comments(this.userId, this.comment);
}
