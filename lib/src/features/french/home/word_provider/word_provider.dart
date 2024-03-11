import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/providers/delay_provider.dart';
import '../../adding_word/model/word_model.dart';
import '../hive_functions/HiveFunctions.dart';

class Word extends StateNotifier<WordModel> {
  Word({required this.delay, required this.hiveFunctions})
      : super(WordModel(
            foreignWord: 'Word to translate', translationWord: 'Meaning')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showWord();
    });
  }
  late Timer _timer;
  final int delay;
  HiveFunctions hiveFunctions;

  Future<void> showWord() async {
    final word = getQuestion();
    state = state.copyWith(
        foreignWord: word.foreignWord,
        translationWord: Constants.progressIndicator);
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(translationWord: word.translationWord);
  }

  void remove() {
    hiveFunctions.removeWord();
  }

  WordModel getQuestion() {
    var wordList = hiveFunctions.getWordList();
    final random = Random().nextInt(wordList.length);
    return wordList[random];
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final wordProvider = StateNotifierProvider<Word, WordModel>((ref) {
  final delay = ref.watch(delayProvider);
  final hive = ref.watch(hiveProvider);
  return Word(delay: delay, hiveFunctions: hive);
});
