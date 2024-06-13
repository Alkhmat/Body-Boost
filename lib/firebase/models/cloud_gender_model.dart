class CloudGenderModel {
  final String image;
  final String type;
  final List<SubItem> subItems;

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
  final String choice;
  final String imageUrl;
  final List<SubSubItem> subSubItems;

  SubItem(
      {required this.choice,
      required this.imageUrl,
      required this.subSubItems});

  factory SubItem.fromMap(
      Map<String, dynamic> map, List<SubSubItem> subSubItems) {
    return SubItem(
      choice: map['choice'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      subSubItems: subSubItems,
    );
  }
}

class SubSubItem {
  final String levelImage;
  final String level;
  final String pushs;

  SubSubItem({
    required this.levelImage,
    required this.level,
    required this.pushs,
  });

  factory SubSubItem.fromMap(Map<String, dynamic> map) {
    return SubSubItem(
      levelImage: map['level_image'] as String? ?? '',
      level: map['level'] as String? ?? '',
      pushs: map['pushs'] as String? ?? '',
    );
  }
}
