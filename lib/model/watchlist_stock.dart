import 'package:equatable/equatable.dart';

class WatchlistStock extends Equatable {
  final String imageUrl;
  final String stockName;
  final double price;
  final double changePercent;

  const WatchlistStock({
    required this.imageUrl,
    required this.stockName,
    required this.price,
    required this.changePercent,
  });

  @override
  List<Object?> get props => [stockName, price, changePercent, imageUrl];
}
