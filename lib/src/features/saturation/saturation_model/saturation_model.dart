class SaturationModel {
  final String saturationDelay;
  final String saturationValue;

  SaturationModel(
      {required this.saturationDelay, required this.saturationValue});

  SaturationModel copyWith({
    String? saturationDelay,
    String? saturationValue,
  }) {
    return SaturationModel(
      saturationDelay: saturationDelay ?? this.saturationDelay,
      saturationValue: saturationValue ?? this.saturationValue,
    );
  }
}
