import 'package:bidder_game/components/bidder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderComponent extends StatefulWidget {
  SliderComponent(
      {this.winChanceCallback,
      this.isValidateInput,
      this.rewardCallback,
      this.userBid});

  final Function winChanceCallback;
  final Function rewardCallback;
  final bool isValidateInput;
  final int userBid;

  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  BidderService _bidderService = BidderService();
  double winChance;
  @override
  void initState() {
    winChance = 0.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NeumorphicSlider(
            value: winChance,
            min: 0.01,
            max: 0.99,
            onChanged: (value) {
              setState(() {
                widget.winChanceCallback(value);
                winChance = value;
                if (widget.isValidateInput) {
                  widget.rewardCallback(_bidderService.calculateReward(
                      widget.userBid, winChance));
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
