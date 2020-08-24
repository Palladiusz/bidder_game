import 'package:bidder_game/blocs/history/history_bloc.dart';
import 'package:bidder_game/screens/history_page.dart';
import 'package:bidder_game/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  static const String id = '/history_screen';

  @override
  Widget build(BuildContext context) {
    AppDatabase db = Provider.of(context);
    return BlocProvider(
      create: (context) => HistoryBloc(db: db)..add(LoadHistoryEvent()),
      child: HistoryPage(),
    );
  }
}
