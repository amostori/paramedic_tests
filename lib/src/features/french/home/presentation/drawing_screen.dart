import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/french/home/presentation/widgets/custom_paint.dart';
import '../../../../app_routing/app_routing.dart';
import '../../../../utils/constants.dart';
import '../word_provider/word_provider.dart';

class DrawingScreen extends ConsumerStatefulWidget {
  const DrawingScreen({super.key});

  @override
  ConsumerState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends ConsumerState<DrawingScreen> {
  final offsets = <Offset?>[];

  @override
  Widget build(BuildContext context) {
    final word = ref.watch(wordProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StringManager.appName.tr()'),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(wordProvider.notifier).remove();
              },
              icon: const Icon(Icons.remove)),
          IconButton(
              onPressed: () {
                setState(() {
                  offsets.clear();
                });
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(wordProvider.notifier).showWord();
          context.goNamed(AppRoute.addingWord.name);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    word.foreignWord,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 50.0,
                  ),
                  word.translationWord == Constants.progressIndicator
                      ? const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator())
                      : SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            word.translationWord,
                            textAlign: TextAlign.center,
                          )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onPanDown: (details) {
                setState(() {
                  offsets.add(details.localPosition);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  offsets.add(details.localPosition);
                });
              },
              onPanEnd: (details) {
                setState(() {
                  offsets.add(null);
                });
              },
              child: CustomPaint(
                painter: MyPainter(offsets: offsets),
                child: Container(
                  color: Colors.black12,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
