import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/french/home/presentation/widgets/custom_paint.dart';
import '../../../../app_routing/app_routing.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/providers/delay_provider.dart';
import '../../../../widgets/floating_button.dart';
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
    final delay = ref.watch(delayProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('$delay s'),
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
              icon: const Icon(Icons.clear)),
          IconButton(
              onPressed: () {
                context.goNamed(AppRoute.addingWord.name);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      floatingActionButton: const FloatingButton(),
      body: Column(
        children: [
          Expanded(
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
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator())
                    : SizedBox(
                        height: 20,
                        width: double.infinity,
                        child: Text(
                          word.translationWord,
                          textAlign: TextAlign.center,
                        )),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.black38,
            width: double.infinity,
          ),
          Expanded(
            flex: 2,
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
                child: const SizedBox(
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
