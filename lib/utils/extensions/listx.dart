extension ListX on List {
  List<T> clone<T>() {
    return [...this];
  }

  List<T> updateValue<T>(T updateItem, bool Function(dynamic) indexWhere) {
    List<T> list = this as List<T>;
    final index = list.indexWhere(indexWhere);
    if (index == -1) return list;
    this[index] = updateItem;

    return list;
  }

  List<T> deleteValue<T>(T deleteItem, bool Function(dynamic) indexWhere) {
    List<T> list = (this as List<T>).toList();
    final index = list.indexWhere(indexWhere);
    if (index == -1) return list;
    list.removeAt(index);
    return list;
  }

  List<T> passerJson<T>(
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    List<T> list =
        (this).map((e) => fromJson(e as Map<String, dynamic>)).toList();

    return list;
  }
}

/// List extension
extension IterableExtension<T> on Iterable<T> {
  /// Insert any item<T> inBetween the list items
  List<T> insertBetween(T item) => expand((e) sync* {
        yield item;
        yield e;
      }).skip(1).toList(growable: false);
}
