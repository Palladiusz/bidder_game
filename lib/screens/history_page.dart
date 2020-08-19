import 'package:bidder_game/blocs/history/history_bloc.dart';
import 'package:bidder_game/widgets/appbar/main_appbar.dart';
import 'package:bidder_game/widgets/clear_history_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HistoryBloc>(context);
    return SafeArea(
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoadedState) {
            return Scaffold(
              appBar: MyAppBar(
                title: 'History of Records',
              ),
              body: ListView(
                shrinkWrap: true,
                children: state.items.toList(),
              ),
              bottomNavigationBar: ClearHistory(
                onPress: () {
                  HistoryBloc(db: bloc.db).add(RestartHistoryEvent());
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
