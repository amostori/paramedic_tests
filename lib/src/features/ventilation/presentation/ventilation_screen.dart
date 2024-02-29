import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/ventilation/vent_provider/ventilation_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class VentilationScreen extends ConsumerStatefulWidget {
  const VentilationScreen({super.key});

  @override
  ConsumerState createState() => _VentilationScreenState();
}

class _VentilationScreenState extends ConsumerState<VentilationScreen> {
  @override
  Widget build(BuildContext context) {
    final ventilation = ref.watch(ventilationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Częstość wentylacji'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: ventilation.age,
        answer: ventilation.ventilationRate,
      ),
    );
  }
}
