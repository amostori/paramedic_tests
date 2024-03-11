import 'package:flutter_riverpod/flutter_riverpod.dart';

final delayProvider = StateProvider<int>((ref) {
  return 2;
});
