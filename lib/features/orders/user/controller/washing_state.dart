class WashingState {
  final int totalPrice;
  final int itemCount;
  final Map<String, int> items;
  WashingState({
    this.items = const {},
    this.totalPrice = 0,
    this.itemCount = 0,
  });
  WashingState copyWith({
    int? totalPrice,
    int? itemCount,
    Map<String, int>? items,
  }) {
    return WashingState(
      totalPrice: totalPrice ?? this.totalPrice,
      itemCount: itemCount ?? this.itemCount,
      items: items ?? this.items,
    );
  }
}
