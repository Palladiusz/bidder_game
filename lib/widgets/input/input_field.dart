import 'package:bidder_game/widgets/input/input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputCtrl;

  int userBid;

  InputField({
    Key key,
    this.inputCtrl,
    this.userBid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Input Your bid below:'),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
              ),
              InputButton(
                icon: Icon(
                  Icons.arrow_left,
                  size: 25,
                  color: Colors.white,
                ),
                onPress: () {
                  int bid = int.parse(inputCtrl.text);

                  if (bid != null && bid > 0) {
                    bid--;
                    inputCtrl.text = bid.toString();
                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
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
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Tap here, good luck!',
                        hintStyle: TextStyle(fontSize: 18),
                      ),
                      controller: inputCtrl,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              InputButton(
                icon: Icon(
                  Icons.arrow_right,
                  size: 25,
                  color: Colors.white,
                ),
                onPress: () {
                  if (inputCtrl.text == '') {
                    inputCtrl.text = '1';
                  } else {
                    int bid = int.parse(inputCtrl.text);
                    if (bid != null) {
                      bid++;
                      inputCtrl.text = bid.toString();
                    }
                  }
                },
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
