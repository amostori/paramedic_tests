import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/body.dart';
import '../../../../widgets/my_floating_button.dart';
import '../../drug_dose_provider/archive/drug_dose_provider.dart';

class DrugScreen extends ConsumerStatefulWidget {
  const DrugScreen({super.key});

  @override
  ConsumerState createState() => _DrugScreenState();
}

class _DrugScreenState extends ConsumerState<DrugScreen> {
  String drugName = 'Nazwa leku';
  int random = 0;
  int drugListLength = drugList.length;
  @override
  Widget build(BuildContext context) {
    final drugDose = ref.watch(drugDoseProvider(random));
    final isLoading = drugDose is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dawkowanie leków'),
      ),
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          setState(() {
            random = Random().nextInt(drugListLength);
            drugName = ref.read(drugListProvider(random));
          });
          ref.read(drugDoseProvider(random).notifier).showDrugDose();
        },
      ),
      body: Body(
          isLoading: isLoading,
          question: drugName,
          answer: '${drugDose.value}'),
    );
  }
}
