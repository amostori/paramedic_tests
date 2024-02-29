import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/saturation/sat_provider/saturation_provider.dart';

import '../../../widgets/body.dart';
import '../../../widgets/my_floating_button.dart';

class SaturationScreen extends ConsumerStatefulWidget {
  const SaturationScreen({super.key});

  @override
  ConsumerState createState() => _SaturationScreenState();
}

class _SaturationScreenState extends ConsumerState<SaturationScreen> {
  // String time = 'Czas';
  int random = 0;

  @override
  Widget build(BuildContext context) {
    final saturation = ref.watch(saturationStateProvider);
    final isLoading = saturation is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturacja noworodka'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(5);
            // time = timeList[random];
          });
          ref.read(saturationStateProvider.notifier).showSaturation(random);
        },
      ),
      body: Body(
          isLoading: isLoading,
          question: '${saturation.value?.saturationDelay}',
          answer: '${saturation.value?.saturationValue}'),
    );
  }
}
