class WeightModel {
  final String age;
  final String weight;

  const WeightModel({
    required this.age,
    required this.weight,
  });

  WeightModel copyWith({
    String? age,
    String? weight,
  }) {
    return WeightModel(
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}
