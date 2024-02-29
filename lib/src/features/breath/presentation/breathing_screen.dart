import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/breath/breath_provider/breathing_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class BreathingScreen extends ConsumerStatefulWidget {
  const BreathingScreen({super.key});

  @override
  ConsumerState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends ConsumerState<BreathingScreen> {
  @override
  Widget build(BuildContext context) {
    final breathing = ref.watch(breathingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Częstość oddechu'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: breathing.age,
        answer: breathing.breathingRate,
      ),
    );
  }
}
