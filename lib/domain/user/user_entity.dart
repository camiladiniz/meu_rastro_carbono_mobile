class UserEntity {
  final String email;
  final String name;
  final String password;

  const UserEntity({required this.name, required this.email, required this.password});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
      };
}
