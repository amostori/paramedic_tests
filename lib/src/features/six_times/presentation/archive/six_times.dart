import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../presentation/style_manager.dart';
import '../../six_provider/archive/six_provider.dart';

class SixTimes extends ConsumerStatefulWidget {
  const SixTimes({super.key});

  @override
  ConsumerState createState() => _SixTimesState();
}

class _SixTimesState extends ConsumerState<SixTimes> {
  int mainNr = 0;
  @override
  Widget build(BuildContext context) {
    final statfulMultiply = ref.watch(six_provider(mainNr));
    bool isLoading = statfulMultiply is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wielokrotność 6'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading
            ? null
            : () {
                int random = Random().nextInt(25);
                setState(() {
                  mainNr = random;
                });
                ref.read(six_provider(random).notifier).showMultiply();
              },
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 100,
                child: Text(
                  '$mainNr',
                  style: StyleManager.bigText,
                ),
              ),
              isLoading
                  ? const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: Text(
                        '$mainNr x 6= ${statfulMultiply.value}',
                        style: StyleManager.mediumText,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
