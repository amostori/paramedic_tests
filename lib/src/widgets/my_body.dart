import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/style_manager.dart';
import '../utils/providers/delay_provider.dart';

class MyBody extends ConsumerWidget {
  const MyBody({
    super.key,
    required this.question,
    required this.answer,
  });
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delay = ref.watch(delayProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/images/kid.png',
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: StyleManager.mediumText,
                ),
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: answer == '-1'
                      ? const Center(
                          child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator()),
                        )
                      : Text(
                          textAlign: TextAlign.center,
                          answer,
                          style: StyleManager.smallText,
                        ),
                ),
              ),
            ],
          ),
        ),
        Text('Opóźnienie: $delay sek.'),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
