import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/saturation/sat_provider/sat_provider.dart';

import '../../../widgets/body.dart';
import '../../../widgets/my_floating_button.dart';

class SaturationScreen extends ConsumerStatefulWidget {
  const SaturationScreen({super.key});

  @override
  ConsumerState createState() => _SaturationScreenState();
}

class _SaturationScreenState extends ConsumerState<SaturationScreen> {
  String time = '1 minuta';
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final saturation = ref.watch(saturationProvider(random));
    final isLoading = saturation is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturacja noworodka'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(2);
            time = ref.read(timeProvider(random));
          });
          ref.read(saturationProvider(random).notifier).showSaturation();
        },
      ),
      body: Body(
          isLoading: isLoading, question: time, answer: '${saturation.value}'),
    );
  }
}
