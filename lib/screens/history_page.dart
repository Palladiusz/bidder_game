import 'package:bidder_game/blocs/history/history_bloc.dart';
import 'package:bidder_game/widgets/appbar/main_appbar.dart';
import 'package:bidder_game/widgets/clear_history_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //TODO Review: BlocBuilder should wrap only list view.
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoadedState) {
            return Scaffold(
              appBar: MyAppBar(
                title: 'History of Records',
              ),
              body: ListView(
                shrinkWrap: true,
                //TODO Review: Remove toList() it is actually a list.
                children: state.items.toList(),
              ),
              bottomNavigationBar: ClearHistory(
                //TODO Review: you dont require to even pass onPress function, this is Single-Use widget, so move BlocProvider.of<> thing to ClearHistoryWidget
                onPress: () {
                  BlocProvider.of<HistoryBloc>(context)
                      .add(RestartHistoryEvent());
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
