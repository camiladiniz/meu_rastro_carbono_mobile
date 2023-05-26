class MealModel {
  final String title;
  final List<MealOptionModel> mealOptions;
  const MealModel({required this.title, required this.mealOptions});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    final optionsList = json['mealOptions'] as List<dynamic>;
    final mealOptions =
        optionsList.map((option) => MealOptionModel.fromJson(option)).toList();

    return MealModel(
      title: json['title'],
      mealOptions: mealOptions,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'mealOptions': mealOptions,
      };
}

class MealOptionModel {
  final String name;
  final String imagePath;
  final double emissiongCO2eqPerPortion;
  final double portionSize;
  final String portionUnit;
  final String source;
  int userPortionAmount;

  MealOptionModel(
      {required this.name,
      required this.imagePath,
      required this.emissiongCO2eqPerPortion,
      required this.portionSize,
      required this.portionUnit,
      required this.source,
      required this.userPortionAmount});

  factory MealOptionModel.fromJson(Map<String, dynamic> json) =>
      MealOptionModel(
        name: json['name'],
        imagePath: json['imagePath'],
        emissiongCO2eqPerPortion: json['emissiongCO2eqPerPortion'],
        portionSize: json['portionSize'],
        portionUnit: json['portionUnit'],
        source: json['source'],
        userPortionAmount: json['userPortionAmount'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
        'emissiongCO2eqPerPortion': emissiongCO2eqPerPortion,
        'portionSize': portionSize,
        'portionUnit': portionUnit,
        'source': source,
        'userPortionAmount': userPortionAmount,
      };
}
