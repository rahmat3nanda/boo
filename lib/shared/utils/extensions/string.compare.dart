extension StringCompare on String? {
  bool get isEmptyOrNull {
    if (this == null) {
      return true;
    }

    return this!.isEmpty;
  }

  bool get isNotEmptyAndNotNull {
    if (this == null) {
      return false;
    }

    return this!.isNotEmpty;
  }
}
