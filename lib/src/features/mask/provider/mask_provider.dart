import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/mask/mask_model/mask_model.dart';
import 'package:paramedic_tests/src/features/weight/providers/archive/weight_provider.dart';
import 'package:paramedic_tests/src/utils/age_helper.dart';

class Mask extends StateNotifier<MaskModel> {
  final int delay;
  late final Timer _timer;
  Mask({
    required this.delay,
  }) : super(const MaskModel(age: 'Wiek dziecka', maskNr: 'Rozmiar maski')) {
    _timer = Timer.periodic(Duration(seconds: delay * 2), (timer) {
      showMask();
    });
  }

  Future<void> showMask() async {
    final random = Random().nextInt(32);
    state = state.copyWith(
        age: AgeHelper.convertToAgeForMask(random), maskNr: '-1');
    await Future.delayed(Duration(seconds: delay));
    state = state.copyWith(maskNr: setMaskNr(random));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String setMaskNr(int age) {
    if (age >= 0 && age <= 10) {
      return 'Maska 1';
    } else if (age == 11) {
      return 'Maska 2';
    } else if (age >= 12 && age <= 17) {
      return 'Maska 4';
    } else if (age >= 18 && age <= 19) {
      return 'Maska 5';
    } else if (age >= 20 && age <= 23) {
      return 'Maska 5 - 6';
    } else if (age == 24) {
      return 'Maska 1';
    } else if (age >= 25 && age <= 27) {
      return 'Maska 2';
    } else if (age >= 28 && age <= 31) {
      return 'Maska 3';
    } else {
      return 'Poza skalą';
    }
  }
}

final maskProvider = StateNotifierProvider.autoDispose<Mask, MaskModel>((ref) {
  final delay = ref.watch(delayProvider);
  return Mask(delay: delay);
});
