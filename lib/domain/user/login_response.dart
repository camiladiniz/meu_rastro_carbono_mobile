class LoginResponse {
  final String token;
  final String name;
  final String userId;

  const LoginResponse(
      {required this.token, required this.name, required this.userId});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
        name: json['name'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'name': name,
        'userId': userId,
      };
}
