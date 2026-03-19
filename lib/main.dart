import 'package:bloc_watchlist_demo/screens/watchlist_screen.dart';
import 'package:bloc_watchlist_demo/cubit/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watchlist',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => WatchlistCubit(),
        child: const WatchlistScreen(),
      ),
    );
  }
}
