import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/mask/provider/mask_provider.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class MaskScreen extends ConsumerStatefulWidget {
  const MaskScreen({super.key});

  @override
  ConsumerState createState() => _MaskScreenState();
}

class _MaskScreenState extends ConsumerState<MaskScreen> {
  @override
  Widget build(BuildContext context) {
    final mask = ref.watch(maskProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rozmiar maski Ambu'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: mask.age,
        answer: mask.maskNr,
      ),
    );
  }
}
