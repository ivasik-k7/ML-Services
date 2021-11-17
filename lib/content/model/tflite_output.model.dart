abstract class TfliteOutput implements Serializable {
  TfliteOutput([double? confidence]);

  TfliteOutput.fromJson(Map<String, dynamic> json);

  double? confidence;
}

abstract class Serializable {
  factory Serializable.fromFunction(dynamic fn) => _FunctionSerializable(fn);
  factory Serializable.fromMap(Map<String, dynamic> map) =>
      Serializable.fromFunction(() => map);
  factory Serializable.fromList(List<Serializable> list) =>
      Serializable.fromFunction(
          () => list.map((Serializable e) => e.toJson()).toList());

  Object toJson();
}

class _FunctionSerializable implements Serializable {
  _FunctionSerializable(this.fn);

  Function fn;

  Object toJson() => fn();
}

class ClassificationOutput extends TfliteOutput {
  ClassificationOutput(
    this.label,
    double confidence,
    this.index,
  ) : super(confidence);

  factory ClassificationOutput.fromJson(Map<String, dynamic> json) =>
      ClassificationOutput(json['label'], json['confidence'], json['index']);

  final int index;
  final String label;

  @override
  Object toJson() => {};
}

class DetectionOutput extends TfliteOutput {
  DetectionOutput(this.label, double confidence, this.rect) : super(confidence);

  factory DetectionOutput.fromJson(Map<String, dynamic> json) =>
      DetectionOutput(
        json['detectedClass'],
        json['confidenceInClass'],
        json['rect'],
      );

  final String label;
  final Map<String, double> rect;

  @override
  Object toJson() => {};
}
