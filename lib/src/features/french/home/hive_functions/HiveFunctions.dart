import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../utils/constants.dart';
import '../../adding_word/model/word_model.dart';
import '../database/database.dart';

class HiveFunctions implements DatabaseInterface {
  static final wordBox = Hive.box<WordModel>(Constants.wordBox);

  @override
  List<WordModel> getWordList() {
    List<WordModel> wordList = [];
    if (wordBox.isNotEmpty) {
      for (WordModel wordModel in wordBox.values) {
        wordList.add(WordModel(
            foreignWord: wordModel.foreignWord,
            translationWord: wordModel.translationWord));
      }
      return wordList;
    } else {
      return [];
    }
  }

  @override
  void removeWord() {
    wordBox.deleteAt(wordBox.length - 1);
  }

  @override
  void addWordToDatabase(WordModel word) {
    WordModel newWord = WordModel(
        foreignWord: word.foreignWord, translationWord: word.translationWord);
    wordBox.add(newWord);
  }
}

final hiveProvider = Provider<HiveFunctions>((ref) {
  return HiveFunctions();
});
