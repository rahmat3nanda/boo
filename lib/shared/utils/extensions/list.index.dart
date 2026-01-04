extension ListIndex<E> on List<E>? {
  E? safeIndex(int? index) {
    if (this == null || index == null) {
      return null;
    }

    if (index < 0 || index >= this!.length) {
      return null;
    }

    return this![index];
  }

  int? indexWhereOrNull(bool Function(E element) test) {
    if (this == null) return null;
    final int index = this!.indexWhere(test);
    return index == -1 ? null : index;
  }
}
