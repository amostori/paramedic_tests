import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/six_times/model/six_model.dart';
import 'package:paramedic_tests/src/features/weight/providers/archive/weight_provider.dart';

class SixTimer extends StateNotifier<SixModel> {
  SixTimer({required this.delay})
      : super(SixModel(mainNr: 0, multiplyNr: 0, nuller: '')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showMultiply();
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  late final Timer _timer;
  final int delay;
  Future<void> showMultiply() async {
    final random = Random().nextInt(25) + 1;
    state = state.copyWith(mainNr: random, multiplyNr: -1);
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(multiplyNr: random * 6);
  }
}

final sixProvider =
    StateNotifierProvider.autoDispose<SixTimer, SixModel>((ref) {
  final random = ref.watch(delayProvider);
  return SixTimer(delay: random);
});
