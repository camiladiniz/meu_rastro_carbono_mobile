class UserEntity {
  final String email;
  final String password;

  const UserEntity({required this.email, required this.password});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
