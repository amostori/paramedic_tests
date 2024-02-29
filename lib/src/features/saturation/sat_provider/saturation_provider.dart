// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:paramedic_tests/src/features/saturation/saturation_model/saturation_model.dart';
// import 'package:paramedic_tests/src/features/weight/providers/weight_provider.dart';
//
// class SaturationState extends StateNotifier<AsyncValue<SaturationModel>> {
//   SaturationState(this.delay)
//       : super(AsyncData(SaturationModel(
//             score: 0,
//             saturationDelay: 'Po ilu minutach',
//             saturationValue: 'Ile procent'))) {
//     _timer = Timer.periodic(Duration(seconds: delay * 2), (_) {
//       time = Random().nextInt(timeList.length);
//       showSaturation(time);
//     });
//   }
//   final List<String> timeList = [
//     'po 2 min',
//     'po 3 min',
//     'po 4 min',
//     'po 5 min',
//     'po 10 min',
//   ];
//   final int delay;
//   late int time;
//   late final Timer _timer;
//
//   String setSaturation(int time) {
//     switch (time) {
//       case 0:
//         return 'Saturacja 60%';
//       case 1:
//         return 'Saturacja 70%';
//
//       case 2:
//         return 'Saturacja 80%';
//
//       case 3:
//         return 'Saturacja 85%';
//
//       case 4:
//         return 'Saturacja 90%';
//
//       default:
//         return 'Saturacja nieokreślona';
//     }
//   }
//
//   @override
//   void dispose() {
//     print('timer before dispose = $_timer');
//
//     _timer.cancel();
//     print('timer = $_timer');
//     super.dispose();
//   }
//
//   Future<void> showSaturation(int time) async {
//     state = AsyncData<SaturationModel>(SaturationModel(
//         score: 0, saturationDelay: timeList[time], saturationValue: 'nuller'));
//     await Future.delayed(Duration(seconds: delay));
//     // state = const AsyncLoading();
//     // await Future.delayed(const Duration(seconds: 2));
//
//     state = await AsyncValue.guard(() async {
//       // await Future.delayed(Duration(seconds: delay));
//       return SaturationModel(
//           score: 0,
//           saturationDelay: timeList[time],
//           saturationValue: setSaturation(time));
//       // return setSaturation(time);
//     });
//   }
// }
//
// final saturationStateProvider =
//     StateNotifierProvider<SaturationState, AsyncValue<SaturationModel>>((ref) {
//   final delay = ref.watch(delayProvider);
//   return SaturationState(delay);
// });
