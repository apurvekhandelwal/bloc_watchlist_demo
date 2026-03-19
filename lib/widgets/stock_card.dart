import 'package:bloc_watchlist_demo/model/watchlist_stock.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final WatchlistStock stock;
  final Widget? leading;
  const StockCard({super.key, required this.stock, this.leading});

  @override
  Widget build(BuildContext context) {
    final isPercentPositive = stock.changePercent >= 0;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        leading: SizedBox(
          width: 80,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ?leading,
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(stock.imageUrl),
              ),
            ],
          ),
        ),
        title: Text(
          stock.stockName,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: Text(
          "₹${stock.price.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 13),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${stock.changePercent.toStringAsFixed(2)}%",
              style: TextStyle(
                color: isPercentPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
