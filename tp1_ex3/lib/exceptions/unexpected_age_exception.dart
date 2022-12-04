class UnexpectedAgeException implements Exception{
  final String _module;

  UnexpectedAgeException(this._module);

  String errorMessage() => 'Policyholder age must be greater than 18 - $_module.';
}