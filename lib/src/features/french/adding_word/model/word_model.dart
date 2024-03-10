import 'package:hive_flutter/adapters.dart';
part 'word_model.g.dart';

@HiveType(typeId: 2)
class WordModel extends HiveObject {
  @HiveField(0)
  String foreignWord;
  @HiveField(1)
  String translationWord;

  WordModel({
    required this.foreignWord,
    required this.translationWord,
  });

  WordModel copyWith({
    String? foreignWord,
    String? translationWord,
  }) {
    return WordModel(
      foreignWord: foreignWord ?? this.foreignWord,
      translationWord: translationWord ?? this.translationWord,
    );
  }
}
