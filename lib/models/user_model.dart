class UserModel {
  final String username;
  final String motivationQuote;
  String? profileImage;

  UserModel({
    required this.username,
    this.motivationQuote = 'One task at a time. One step closer.',
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      motivationQuote: json['motivationQuote'],
      profileImage: json['profileImage'],
    );
  }

  toJson() {
    return {
      'username': username,
      'motivationQuote': motivationQuote,
      'profileImage': profileImage,
    };
  }

  @override
  String toString() =>
      'UserModel(username: $username, motivationQuote: $motivationQuote, profileImage: $profileImage)';
}
