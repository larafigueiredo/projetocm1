class IntegrityException implements Exception{
  final String _module;

  IntegrityException(this._module);

  String errorMessage() => 'Erro ao Apagar! Ainda existem apólices associadas a esta entidade. $_module.';
}