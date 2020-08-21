import 'package:bidder_game/blocs/blocs.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:bidder_game/screens/home_screen.dart';
import 'package:bidder_game/services/bidder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String id = '/home_screen';
  BidderService _bidderService = BidderService();

  @override
  Widget build(BuildContext context) {
    AppDatabase db = Provider.of(context);
    return BlocProvider(
      create: (context) => PlayBloc(db: db)..add(PlayEventInitial()),
      child: HomeScreen(),
    );
  }
}
