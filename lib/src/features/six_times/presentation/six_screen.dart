import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/six_times/six_provider/six_timer_provider.dart';
import 'package:paramedic_tests/src/widgets/floating_button.dart';
import 'package:paramedic_tests/src/widgets/my_body.dart';

class SixScreen extends ConsumerStatefulWidget {
  const SixScreen({super.key});

  @override
  ConsumerState createState() => _SixScreenState();
}

class _SixScreenState extends ConsumerState<SixScreen> {
  @override
  Widget build(BuildContext context) {
    final six = ref.watch(sixProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wielokrotność 6'),
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: six.mainNr.toString(),
        answer: six.multiplyNr.toString(),
      ),
    );
  }
}
