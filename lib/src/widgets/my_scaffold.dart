import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/weight/providers/weight_provider.dart';
import '../presentation/style_manager.dart';

class Body extends ConsumerWidget {
  const Body({
    super.key,
    required this.isLoading,
    required this.question,
    required this.answer,
  });
  final bool isLoading;
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delay = ref.watch(delayProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  child: Text(
                    question,
                    style: StyleManager.mediumText,
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
                          answer,
                          style: StyleManager.mediumText,
                        ),
                      ),
              ],
            ),
          ),
        ),
        Text('Opóźnienie: $delay sek.'),
      ],
    );
  }
}
