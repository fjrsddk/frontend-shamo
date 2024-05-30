class UserModel {
  final int? id;
  final String? name, email, username;
  late String profilePhotoUrl;
  late String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    required this.profilePhotoUrl,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?, // Cast as int? for null safety
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
