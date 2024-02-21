import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/weight/providers/weight_provider.dart';

class Saturation extends FamilyAsyncNotifier<String, int> {
  late int _time;
  @override
  FutureOr<String> build(int arg) {
    _time = arg;
    return setSaturation(arg);
  }

  Future<void> showSaturation() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: ref.watch(delayProvider)));
      return setSaturation(_time);
    });
  }

  String setSaturation(int time) {
    switch (time) {
      case 0:
        return 'Saturacja 70%';
      case 1:
        return 'Saturacja 80%';
      default:
        return 'Hej saturacja nieokreślona';
    }
  }
}

final List<String> timeList = [
  '1 minuta',
  '2 minuty',
];
final timeProvider =
    Provider.family<String, int>((ref, random) => timeList[random]);
final saturationProvider =
    AsyncNotifierProvider.family<Saturation, String, int>(() {
  return Saturation();
});
