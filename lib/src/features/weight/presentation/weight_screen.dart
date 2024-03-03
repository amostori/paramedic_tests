import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/weight/providers/weight_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class WeightScreen extends ConsumerStatefulWidget {
  const WeightScreen({super.key});

  @override
  ConsumerState createState() => _WeightScreenState();
}

class _WeightScreenState extends ConsumerState<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    final weight = ref.watch(weightProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waga wg wieku'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: weight.age,
        answer: weight.weight,
      ),
    );
  }
}
