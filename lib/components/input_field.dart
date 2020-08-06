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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 54.0),
      child: Neumorphic(
        child: TextField(
          controller: myController,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: 'Insert your bid',
            labelStyle: TextStyle(
              fontSize: 26.0,
            ),
          ),
          onChanged: (value) {
            setState(() {
              var inputValue = int.tryParse(value);
              if (inputValue != null && inputValue < widget.userCoinsAmount) {
                validate = true;
                widget.validation(validate);
                int userBid = inputValue;

                widget.rewardPass(
                    _bidderService.calculateReward(userBid, widget.winChance));
              } else {
                validate = false;
                widget.validation(validate);
              }
            });
          },
        ),
      ),
    );
  }
}
