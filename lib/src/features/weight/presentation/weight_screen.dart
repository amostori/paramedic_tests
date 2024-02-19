import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/age_helper.dart';
import '../../../utils/constants.dart';
import '../../../widgets/my_floating_button.dart';
import '../../../widgets/body.dart';
import '../providers/weight_provider.dart';

class WeightScreen extends ConsumerStatefulWidget {
  const WeightScreen({super.key});

  @override
  ConsumerState createState() => _WeightScreenState();
}

class _WeightScreenState extends ConsumerState<WeightScreen> {
  String age = 'Wiek dziecka';
  int random = 0;

  @override
  Widget build(BuildContext context) {
    // AsyncLoading pojawi się jeśli random będzie w setState()
    final weight = ref.watch(weightProvider(random));
    final isLoading = weight is AsyncLoading;
    return Scaffold(
      appBar: AppBar(title: const Text('Waga pacjenta')),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(RandomLimits.limit);
            age = AgeHelper.convertToAge(random);
          });
          ref.read(weightProvider(random).notifier).showWeight();
        },
      ),
      body: Body(
        question: age,
        answer: 'Waga: ${weight.value} kg',
        isLoading: isLoading,
      ),
    );
  }
}
