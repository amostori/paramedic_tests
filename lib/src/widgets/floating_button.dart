import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/weight/providers/archive/weight_provider.dart';

class FloatingButton extends ConsumerWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delay = ref.watch(delayProvider);
    final isBelowZero = delay < 2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(delayProvider.notifier).state++;
          },
          heroTag: 'hero1',
          child: const Icon(Icons.plus_one),
        ),
        FloatingActionButton(
          onPressed: isBelowZero
              ? null
              : () {
                  ref.read(delayProvider.notifier).state--;
                },
          heroTag: 'hero2',
          child: const Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }
}
