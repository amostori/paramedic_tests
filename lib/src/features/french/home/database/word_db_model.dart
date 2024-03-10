import 'package:hive/hive.dart';
part 'word_db_model.g.dart';

@HiveType(typeId: 1)
class WordDBModel extends HiveObject {
  @HiveField(0)
  String question;
  @HiveField(1)
  String answer;

  WordDBModel(this.question, this.answer);
}
