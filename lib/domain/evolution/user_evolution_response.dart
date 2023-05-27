class UserEvolutionResponse {
  final int totalPontuation;

  const UserEvolutionResponse(
      {required this.totalPontuation});

  factory UserEvolutionResponse.fromJson(Map<String, dynamic> json) => UserEvolutionResponse(
        totalPontuation: json['totalPontuation'],
      );

  Map<String, dynamic> toJson() => {
        'totalPontuation': totalPontuation,
      };
}
