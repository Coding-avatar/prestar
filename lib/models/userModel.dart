class AppUser {
  final String uid;
  final String name;
  final String email;
  final String? phone;
  final String? profile_pic;
  final String? cover_pic;
  final String? bio;
  final String? businessName;
  final List<String>? businessLogo;
  final DateTime? dob;
  final String? location;
  final List<String>? preferences;
  final List<String>? businessCategories;
  final List<String>? followers;
  final List<String>? following;
  final List<String>? posts;

  AppUser(
      {required this.uid,
      required this.name,
      required this.email,
      this.phone,
      this.profile_pic,
      this.cover_pic,
      this.bio,
      this.businessName,
      this.businessLogo,
      this.dob,
      this.location,
      this.preferences,
      this.businessCategories,
      this.followers,
      this.following,
      this.posts});
}
