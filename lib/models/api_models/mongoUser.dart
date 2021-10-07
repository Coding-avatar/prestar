class MongoUser {
  late Location? location;
  late List<String>? preferences;
  late List<String>? businessCategories;
  late List<String>? businessLogos;
  late bool businessIsPresent;
  late bool phoneIsVerified;
  late bool usedEmailAuth;
  late bool usedGoogleAuth;
  late bool emailIsVerified;
  late String sId;
  late String name;
  late String email;
  late List<Following>? following;
  late List<Following>? followers;
  late int iV;
  late String profileImage;

  MongoUser(
      {this.location,
      this.preferences,
      this.businessCategories,
      this.businessLogos,
      required this.businessIsPresent,
      required this.phoneIsVerified,
      required this.usedEmailAuth,
      required this.usedGoogleAuth,
      required this.emailIsVerified,
      required this.sId,
      required this.name,
      required this.email,
      this.following,
      this.followers,
      this.profileImage =
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      required this.iV});

  MongoUser.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] == [] ? null : new Location.fromJson(json['location']);
    preferences = json['preferences'].cast<String>();
    businessCategories = json['businessCategories'].cast<String>();
    businessLogos = json['businessLogos'].cast<String>();
    businessIsPresent = json['businessIsPresent'];
    phoneIsVerified = json['phoneIsVerified'];
    usedEmailAuth = json['usedEmailAuth'];
    usedGoogleAuth = json['usedGoogleAuth'];
    emailIsVerified = json['emailIsVerified'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    if (json['following'] != List.empty()) {
      following = new List<Following>.empty(growable: true);
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    } else {
      following = List.empty();
    }
    if (json['followers'] != List.empty()) {
      followers = new List<Following>.empty(growable: true);
      json['followers'].forEach((v) {
        followers!.add(new Following.fromJson(v));
      });
    } else {
      followers = List.empty();
    }
    iV = json['__v'];
    profileImage = json['profileImage'] ?? profileImage;
  }
}

class Location {
  late String type;
  late List<double> coordinates;
  late String address;
  late String description;
  Location(
      {required this.type,
      required this.coordinates,
      required this.address,
      this.description = ''});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates =
        json['coordinates'] == [] ? [] : json['coordinates'].cast<double>();
    address = json['address'] == null ? '' : json['address'];
    description = json['description'] == null ? '' : json['description'];
  }
}

class Following {
  late String sId;
  late String refUserId;
  late String refUserName;
  Following(
      {required this.sId, required this.refUserId, required this.refUserName});

  Following.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    refUserId = json['refUserId'];
    refUserName = json['refUserName'];
  }
}
