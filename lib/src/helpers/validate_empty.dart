class ValidateEmpty {
  static emptyInput(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'este campo es requerido';
    }
    return null;
  }
}
