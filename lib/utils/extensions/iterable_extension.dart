extension GenericIterableExtentions<T> on Iterable {
  Iterable<E> mapIndexed<E, T>(E Function(int index, T item) f) sync* {
    int index = 0;
    for (final T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }

  T? firstOrDefault(T defaultValue) => isNullOrEmpty ? defaultValue : first;
}

extension NullableIterableExtentions on Iterable? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
