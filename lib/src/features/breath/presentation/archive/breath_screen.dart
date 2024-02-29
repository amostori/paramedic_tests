import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/age_helper.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/my_floating_button.dart';
import '../../../../widgets/body.dart';
import '../../breath_provider/archive/breath_provider.dart';

class BreathScreen extends ConsumerStatefulWidget {
  const BreathScreen({super.key});

  @override
  ConsumerState createState() => _BreathScreenState();
}

class _BreathScreenState extends ConsumerState<BreathScreen> {
  String age = 'Wiek dziecka';
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final breath = ref.watch(breathProvider(random));
    final isLoading = breath is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Częstość oddechu'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(RandomLimits.limit);
            age = AgeHelper.convertToAge(random);
          });
          ref.read(breathProvider(random).notifier).showBreath();
        },
      ),
      body: Body(
        question: age,
        answer: '${breath.value}',
        isLoading: isLoading,
      ),
    );
  }
}