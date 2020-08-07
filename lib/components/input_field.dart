import 'package:bidder_game/components/bidder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InputField extends StatefulWidget {
  final Function validation;

  final Function rewardPass;
  final Function toggleInputValue;
  final int userCoinsAmount;
  final double winChance;

  InputField(
      {this.validation,
      this.userCoinsAmount,
      this.winChance,
      this.rewardPass,
      this.toggleInputValue});
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  BidderService _bidderService = BidderService();
  bool validate;

  final myController = TextEditingController();

  getValue() {
    var text = myController.text;
    if (text != '') {
      widget.toggleInputValue(int.parse(text));
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myController.addListener(() {
      getValue();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Input Your bid below:'),
        SizedBox(
          height: 9,
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
                decoration: InputDecoration(
                  hintText: 'Tap here, good luck!',
                ),
                controller: myController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
                onChanged: (value) {
                  setState(() {
                    var inputValue = int.tryParse(value);
                    if (inputValue != null &&
                        inputValue < widget.userCoinsAmount) {
                      validate = true;
                      widget.validation(validate);
                      int userBid = inputValue;

                      widget.rewardPass(_bidderService.calculateReward(
                          userBid, widget.winChance));
                    } else {
                      validate = false;
                      widget.validation(validate);
                    }
                  });
                },
              )),
        ),
      ],
    );
  }
}
