class Transference {
  final double value;
  final int accountNumber;

  Transference(
    this.accountNumber,
    this.value,
  );

  @override
  String toString() {
    return 'Transferência{value: $value, accountNumber: $accountNumber';
  }
}
