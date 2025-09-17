class UserModel {
  final String username;
  final String motivationQuote;

  UserModel({
    required this.username,
    this.motivationQuote = 'One task at a time. One step closer.',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      motivationQuote: json['motivationQuote'],
    );
  }

  toJson() {
    return {'username': username, 'motivationQuote': motivationQuote};
  }
}
