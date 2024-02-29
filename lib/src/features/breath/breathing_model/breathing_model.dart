class BreathingModel {
  final String age;
  final String breathingRate;

  const BreathingModel({
    required this.age,
    required this.breathingRate,
  });

  BreathingModel copyWith({
    String? age,
    String? breathingRate,
  }) {
    return BreathingModel(
      age: age ?? this.age,
      breathingRate: breathingRate ?? this.breathingRate,
    );
  }
}
