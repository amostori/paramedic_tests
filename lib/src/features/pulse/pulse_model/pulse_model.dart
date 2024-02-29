class PulseModel {
  final String age;
  final String pulseRate;

  const PulseModel({
    required this.age,
    required this.pulseRate,
  });

  PulseModel copyWith({
    String? age,
    String? pulseRate,
  }) {
    return PulseModel(
      age: age ?? this.age,
      pulseRate: pulseRate ?? this.pulseRate,
    );
  }
}
