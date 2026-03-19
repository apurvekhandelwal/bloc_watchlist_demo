import 'package:bloc_watchlist_demo/model/watchlist_stock.dart';
import 'package:bloc_watchlist_demo/cubit/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistLoading()) {
    loadStocks();
  }

  void loadStocks() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(
        WatchlistLoaded([
          WatchlistStock(
            imageUrl: "assets/logos/icici.png",
            stockName: "ICICI Prud. Asset Man",
            price: 180.25,
            changePercent: 1.2,
          ),
          WatchlistStock(
            imageUrl: "assets/logos/cipla.png",
            stockName: "Cipla",
            price: 750.10,
            changePercent: 2.3,
          ),
          WatchlistStock(
            imageUrl: "assets/logos/coal.png",
            stockName: "Coal India",
            price: 3400.00,
            changePercent: -1.1,
          ),
          WatchlistStock(
            imageUrl: "assets/logos/paytm.png",
            stockName: "Paytm",
            price: 1041.08,
            changePercent: 3.2,
          ),
          WatchlistStock(
            imageUrl: "assets/logos/vedanta.png",
            stockName: "Vedanta",
            price: 665.30,
            changePercent: -3.2,
          ),
        ]),
      );
    } catch (e) {
      emit(const WatchlistError("Failed to load stocks"));
    }
  }

  // Handles drag & reorder logic
  void reorderStocks(int oldIndex, int newIndex) {
    if (state is! WatchlistLoaded) return;

    final currentState = state as WatchlistLoaded;

    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final updatedList = List<WatchlistStock>.from(currentState.stocks);

    final movedStock = updatedList.removeAt(oldIndex);
    updatedList.insert(newIndex, movedStock);

    emit(currentState.copyWith(stocks: updatedList));
  }
}
