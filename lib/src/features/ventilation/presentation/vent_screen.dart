import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/age_helper.dart';
import '../../../utils/constants.dart';
import '../../../widgets/my_floating_button.dart';
import '../../../widgets/body.dart';
import '../vent_provider/vent_provider.dart';

class VentScreen extends ConsumerStatefulWidget {
  const VentScreen({super.key});

  @override
  ConsumerState createState() => _VentScreenState();
}

class _VentScreenState extends ConsumerState<VentScreen> {
  String age = 'Wiek dziecka';
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final vent = ref.watch(ventProvider(random));
    final isLoading = vent is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Częstość wentylacji'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(RandomLimits.limit);
            age = AgeHelper.convertToAge(random);
          });
          ref.read(ventProvider(random).notifier).showVent();
        },
      ),
      body: Body(isLoading: isLoading, question: age, answer: '${vent.value}'),
    );
  }
}
