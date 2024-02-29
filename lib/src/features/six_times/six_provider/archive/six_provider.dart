import 'package:flutter_riverpod/flutter_riverpod.dart';

class Multiply extends StateNotifier<AsyncValue<int>> {
  Multiply({required this.mainNr}) : super(const AsyncData(0));
  final int mainNr;

  // Future<void> showMultiply() async {
  //   try {
  //     state = const AsyncLoading();
  //     await Future.delayed(const Duration(seconds: 2));
  //   } catch (e) {
  //     state = AsyncError('error', StackTrace.current);
  //   } finally {
  //     state = AsyncData(mainNr * 6);
  //   }
  // }
  Future<void> showMultiply() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await Future.delayed(const Duration(seconds: 2));
        return mainNr * 6;
      },
    );
  }
}

final six_provider =
    StateNotifierProvider.family<Multiply, AsyncValue<int>, int>((ref, mainNr) {
  return Multiply(mainNr: mainNr);
});
