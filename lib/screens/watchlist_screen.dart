import 'package:bloc_watchlist_demo/cubit/watchlist_cubit.dart';
import 'package:bloc_watchlist_demo/cubit/watchlist_state.dart';
import 'package:bloc_watchlist_demo/widgets/stock_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        centerTitle: true,
        elevation: 2,
      ),
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WatchlistError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is WatchlistLoaded) {
            return ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemBuilder: (context, index) {
                final stock = state.stocks[index];
                return Container(
                  key: ValueKey(stock.imageUrl),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: StockCard(
                    stock: stock,
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_indicator),
                    ),
                  ),
                );
              },
              itemCount: state.stocks.length,
              onReorder: (oldIndex, newIndex) {
                context.read<WatchlistCubit>().reorderStocks(
                  oldIndex,
                  newIndex,
                );
              },
              proxyDecorator: (child, index, animation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final scale = 1 + (animation.value * 0.05);

                    return Transform.scale(scale: scale, child: child);
                  },
                  child: child,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
