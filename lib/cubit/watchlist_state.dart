import 'package:bloc_watchlist_demo/model/watchlist_stock.dart';
import 'package:equatable/equatable.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

class WatchlistLoading extends WatchlistState {
  const WatchlistLoading();
}

class WatchlistLoaded extends WatchlistState {
  final List<WatchlistStock> stocks;

  const WatchlistLoaded(this.stocks);

  WatchlistLoaded copyWith({List<WatchlistStock>? stocks}) {
    return WatchlistLoaded(stocks ?? this.stocks);
  }

  @override
  List<Object?> get props => [stocks];
}

class WatchlistError extends WatchlistState {
  final String errorMessage;

  const WatchlistError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
