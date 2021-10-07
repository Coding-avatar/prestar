class PostData {
  late List<String> contentCategories;
  late String sId;
  late String authorId;
  late String authorName;
  late String title;
  late String contentType;
  late String mediaUrl;
  late String targetAudience;
  late List<Comments> comments;
  late List<Likes> likes;
  late int iV;

  PostData(
      {required this.contentCategories,
      required this.authorId,
      required this.sId,
      required this.authorName,
      required this.title,
      required this.contentType,
      required this.mediaUrl,
      required this.targetAudience,
      required this.comments,
      required this.likes,
      required this.iV});

  PostData.fromJson(Map<String, dynamic> json) {
    contentCategories = json['contentCategories'].cast<String>();
    sId = json['_id'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    title = json['title'];
    contentType = json['contentType'];
    mediaUrl = json['mediaUrl'];
    targetAudience = json['targetAudience'];
    if (json['comments'] != []) {
      comments = new List<Comments>.empty(growable: true);
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    } else {
      comments = [];
    }
    if (json['likes'] != []) {
      likes = new List<Likes>.empty(growable: true);
      json['likes'].forEach((v) {
        likes.add(new Likes.fromJson(v));
      });
    } else {
      likes = [];
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentCategories'] = this.contentCategories;
    data['_id'] = this.sId;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    data['title'] = this.title;
    data['contentType'] = this.contentType;
    data['mediaUrl'] = this.mediaUrl;
    data['targetAudience'] = this.targetAudience;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Comments {
  late String sId;
  late String authorId;
  late String authorName;
  late String authorProfileImage;
  late String message;

  Comments(
      {required this.sId,
      required this.authorId,
      required this.authorName,
      required this.authorProfileImage,
      required this.message});

  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    authorProfileImage = json['authorProfileImage'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    data['authorProfileImage'] = this.authorProfileImage;
    data['message'] = this.message;
    return data;
  }
}

class Likes {
  late String sId;
  late String authorId;
  late String authorName;
  late String authorProfileImage;

  Likes(
      {required this.sId,
      required this.authorId,
      required this.authorName,
      required this.authorProfileImage});

  Likes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    authorProfileImage = json['authorProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    data['authorProfileImage'] = this.authorProfileImage;
    return data;
  }
}
