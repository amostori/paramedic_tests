import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/age_helper.dart';
import '../../../utils/constants.dart';
import '../../../widgets/my_floating_button.dart';
import '../../../widgets/my_scaffold.dart';
import '../provider/maskProvider.dart';

class MaskScreen extends ConsumerStatefulWidget {
  const MaskScreen({super.key});

  @override
  ConsumerState createState() => _MaskScreenState();
}

class _MaskScreenState extends ConsumerState<MaskScreen> {
  String age = '';
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final mask = ref.watch(maskProvider(random));
    final isLoading = mask is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maska Ambu'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(RandomLimits.limitForMask);
            age = AgeHelper.convertToAgeForMask(random);
          });
          ref.read(maskProvider(random).notifier).showMask();
        },
      ),
      body: Body(isLoading: isLoading, question: age, answer: '${mask.value}'),
    );
  }
}
