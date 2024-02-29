import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/widgets/my_body.dart';

import '../../../widgets/floating_button.dart';
import '../sat_provider/sat_provider.dart';

class SaturationScreen extends ConsumerStatefulWidget {
  const SaturationScreen({super.key});

  @override
  ConsumerState createState() => _SaturationScreenState();
}

class _SaturationScreenState extends ConsumerState<SaturationScreen> {
  int random = 0;

  @override
  Widget build(BuildContext context) {
    final saturation = ref.watch(saturationStateProvider);
    final isLoading = saturation is AsyncLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saturacja nwdka: '),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
          question: saturation.saturationDelay,
          answer: saturation.saturationValue),
    );
  }
}
