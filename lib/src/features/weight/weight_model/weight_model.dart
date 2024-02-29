class WeightModel {
  final String age;
  final int weight;

  const WeightModel({
    required this.age,
    required this.weight,
  });

  WeightModel copyWith({
    String? age,
    int? weight,
  }) {
    return WeightModel(
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}
