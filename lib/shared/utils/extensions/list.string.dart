extension ListJoinString on List<String?>? {
  String nullableJoin([String separator = '']) {
    if (this == null) return '';
    if (this!.isEmpty) return '';
    return this!
        .whereType<String>()
        .where((String e) => e.isNotEmpty)
        .toList()
        .join(separator);
  }
}
