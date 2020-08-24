import 'package:bidder_game/blocs/history/history_bloc.dart';
import 'package:bidder_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ClearHistoryButton extends StatelessWidget {
  const ClearHistoryButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: NeumorphicButton(
        style: NeumorphicStyle(
          depth: 2,
          intensity: 0.5,
          lightSource: LightSource.top,
          color: kDarkerAccent,
        ),
        onPressed: () {
          BlocProvider.of<HistoryBloc>(context).add(RestartHistoryEvent());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Clear history',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
