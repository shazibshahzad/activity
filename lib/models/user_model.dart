class UserModel {
  final String userId;
  final String userType; // Admin, Super Admin, User
  final String token;

  UserModel({required this.userId, required this.userType, required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userType: json['userType'],
      token: json['token'],
    );
  }
}
