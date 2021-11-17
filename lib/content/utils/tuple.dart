class Tuple<L, R> {
  Tuple({
    this.value1,
    this.value2,
  });

  L? value1;
  R? value2;

  @override
  String toString() => 'Tuple($value1, $value2)';
}
