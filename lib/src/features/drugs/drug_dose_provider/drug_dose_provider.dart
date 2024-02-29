import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weight/providers/archive/weight_provider.dart';

class DrugDose extends StateNotifier<AsyncValue<String>> {
  DrugDose(this.delay, {required this.drugId})
      : super(const AsyncData('Dawkowanie leków u dzieci'));
  final int delay;
  final int drugId;

  Future<void> showDrugDose() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: delay));
      return setDrugDose(drugId);
    });
  }

  String setDrugDose(int drugId) {
    switch (drugId) {
      case 0: // Mf
        return 'Rozcieńcz 10 mg do 10 ml.\nDawka: 0,1 ml/kg';
      case 1: // Fentanyl
        return 'Rozcieńcz 0,1 mg do 10 ml.\nDawka: 0,1 ml/kg';
      case 2: // Paracetamol
        return 'Dziecko <10 kg: Dawka: 0,75 ml/kg\nDziecko >10 kg Dawka: 1,5 '
            'ml/kg';
      case 3: // Midazolam i.m.
        return 'Rozcieńcz 5 mg do 5 ml\n\nDawka: 0,2 ml/kg';
      default:
        return 'nothing hill';
    }
  }
}

final drugDoseProvider =
    StateNotifierProvider.family<DrugDose, AsyncValue<String>, int>(
        (ref, drugId) {
  final delay = ref.watch(delayProvider);
  return DrugDose(delay, drugId: drugId);
});
final List<String> drugList = [
  'Morfina',
  'Fentanyl',
  'Paracetamol',
  'Midazolam - padaczka i.m.'
];

final drugListProvider = Provider.family<String, int>((ref, random) {
  final drugName = drugList[random];
  return drugName;
});
