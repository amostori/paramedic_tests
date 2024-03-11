import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/providers/delay_provider.dart';

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({super.key, required this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final delay = ref.watch(delayProvider);
    final isBelowZero = delay < 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 60,
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(delayProvider.notifier).state++;
              },
              heroTag: 'hero1',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 20,
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
        ),
        FloatingActionButton(
          onPressed: onTap,
          heroTag: 'hero3',
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
