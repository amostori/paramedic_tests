import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/age_helper.dart';
import '../../../utils/constants.dart';
import '../../../widgets/my_floating_button.dart';
import '../../../widgets/body.dart';
import '../pulse_provider/pulse_provider.dart';

class PulseScreen extends ConsumerStatefulWidget {
  const PulseScreen({super.key});

  @override
  ConsumerState createState() => _PulseScreenState();
}

class _PulseScreenState extends ConsumerState<PulseScreen> {
  String age = 'Wiek dziecka';
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final pulse = ref.watch(pulseProvider(random));
    final isLoading = pulse is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akcja serca'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(RandomLimits.limit);
            age = AgeHelper.convertToAge(random);
          });
          ref.read(pulseProvider(random).notifier).showPulse();
        },
      ),
      body: Body(isLoading: isLoading, question: age, answer: '${pulse.value}'),
    );
  }
}
