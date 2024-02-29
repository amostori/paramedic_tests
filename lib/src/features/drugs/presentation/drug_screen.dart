import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/drugs/drug_dose_provider/drug_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class DrugScreen extends ConsumerStatefulWidget {
  const DrugScreen({super.key});

  @override
  ConsumerState createState() => _DrugScreenState();
}

class _DrugScreenState extends ConsumerState<DrugScreen> {
  @override
  Widget build(BuildContext context) {
    final drug = ref.watch(drugProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dawkowanie leków'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: drug.drugName,
        answer: drug.drugDose,
      ),
    );
  }
}
