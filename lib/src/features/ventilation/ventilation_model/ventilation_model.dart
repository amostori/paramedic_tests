class VentilationModel {
  final String age;
  final String ventilationRate;

  const VentilationModel({
    required this.age,
    required this.ventilationRate,
  });

  VentilationModel copyWith({
    String? age,
    String? ventilationRate,
  }) {
    return VentilationModel(
      age: age ?? this.age,
      ventilationRate: ventilationRate ?? this.ventilationRate,
    );
  }
}
