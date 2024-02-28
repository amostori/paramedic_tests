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
  String time = 'Czas';
  int random = 0;
  final List<String> timeList = [
    'po 2 min',
    'po 3 min',
    'po 4 min',
    'po 5 min',
    'po 10 min',
  ];
  @override
  Widget build(BuildContext context) {
    final saturation = ref.watch(saturationStateProvider(random));
    final isLoading = saturation is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturacja noworodka'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(5);
            time = timeList[random];
          });
          ref.read(saturationStateProvider(random).notifier).showSaturation();
        },
      ),
      body: Body(
          isLoading: isLoading, question: time, answer: '${saturation.value}'),
    );
  }
  // Widget build(BuildContext context) {
  //   final saturation = ref.watch(saturationGProvider(random));
  //   final isLoading = saturation is AsyncLoading;
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Saturacja noworodka'),
  //     ),
  //     floatingActionButton: MyFloatingActionButton(
  //       onTap: () {
  //         setState(() {
  //           random = Random().nextInt(2);
  //           time = timeList[random];
  //           // time = ref.read(timeProvider(random));
  //         });
  //         ref.read(saturationGProvider(random).notifier).showSaturation();
  //       },
  //     ),
  //     body: Body(
  //         isLoading: isLoading, question: time, answer: '${saturation.value}'),
  //   );
  // }
}
