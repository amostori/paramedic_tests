import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home/hive_functions/HiveFunctions.dart';
import '../../home/word_provider/word_provider.dart';
import '../model/word_model.dart';

class AddingWordScreen extends ConsumerWidget {
  AddingWordScreen({super.key});
  final TextEditingController frenchWordController = TextEditingController();
  final TextEditingController translationWordController =
      TextEditingController();
  // final HiveFunctions hiveFunctions = HiveFunctions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hiveFunctions = ref.watch(hiveProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj nowe słowo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            // only numbers 0 - 9 and + sing are accepted in TextField
            TextField(
              controller: frenchWordController,
              decoration: const InputDecoration(
                  labelText: 'Nowe słowo', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: translationWordController,
              decoration: const InputDecoration(
                  labelText: 'Tłumaczenie', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (frenchWordController.text != '' &&
                        translationWordController.text != '') {
                      final newWord = WordModel(
                          foreignWord: frenchWordController.text,
                          translationWord: translationWordController.text);
                      hiveFunctions.addWordToDatabase(newWord);
                      ref.read(wordProvider.notifier).showWord();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Dodaj',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
