import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputCtrl;

  const InputField({Key key, this.inputCtrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Input Your bid below:'),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54.0),
          child: Neumorphic(
              style: NeumorphicStyle(
                border: NeumorphicBorder(
                  isEnabled: true,
                  width: 4,
                ),
                depth: 3,
                intensity: 0.2,
              ),
              child: TextField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: 'Tap here, good luck!',
                ),
                controller: inputCtrl,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              )),
        ),
      ],
    );
  }
}
