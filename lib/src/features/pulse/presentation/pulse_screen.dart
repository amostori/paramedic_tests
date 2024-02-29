import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/pulse/pulse_provider/pulse_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class PulseScreen extends ConsumerStatefulWidget {
  const PulseScreen({super.key});

  @override
  ConsumerState createState() => _PulseScreenState();
}

class _PulseScreenState extends ConsumerState<PulseScreen> {
  @override
  Widget build(BuildContext context) {
    final pulse = ref.watch(pulseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Częstość tętna'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: pulse.age,
        answer: pulse.pulseRate,
      ),
    );
  }
}
