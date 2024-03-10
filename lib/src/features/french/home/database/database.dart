import '../../adding_word/model/word_model.dart';

abstract class DatabaseInterface {
  List<WordModel> getWordList();
  void addWordToDatabase(WordModel wordModel);
  void removeWord();
}
