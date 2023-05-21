class ReferenceModel {
  final String theme;
  final List<ReferenceItemModel> references;

  ReferenceModel({required this.theme, required this.references});
}

class ReferenceItemModel {
  final String title;
  final String link;

  ReferenceItemModel({required this.title, required this.link});
}
