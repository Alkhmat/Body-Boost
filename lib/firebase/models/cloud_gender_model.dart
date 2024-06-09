class CloudGenderModel {
  final String image;
  final String type;
  final List<SubItem> subItems; // Добавляем субколлекции

  CloudGenderModel({
    required this.image,
    required this.type,
    required this.subItems,
  });

  factory CloudGenderModel.fromMap(
      Map<String, dynamic> map, List<SubItem> subItems) {
    return CloudGenderModel(
      image: map['image'] as String? ?? '',
      type: map['type'] as String? ?? '',
      subItems: subItems,
    );
  }
}

class SubItem {
  final String choise;
  final String imageUrl;

  SubItem({required this.choise, required this.imageUrl});

  factory SubItem.fromMap(Map<String, dynamic> map) {
    return SubItem(
      choise: map['choise'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }
}
