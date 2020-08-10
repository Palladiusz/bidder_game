import 'package:bidder_game/components/bidder_service.dart';
import 'package:bidder_game/components/slider_button.dart';
import 'package:bidder_game/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderComponent extends StatefulWidget {
  SliderComponent(
      {this.winChanceCallback,
      this.isValidateInput,
      this.rewardCallback,
      this.userBid,
      this.winChance});

  final Function winChanceCallback;
  final Function rewardCallback;
  final bool isValidateInput;
  final int userBid;
  final double winChance;

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
    void updateSlider(value) {
      widget.winChanceCallback(value);
      winChance = value;
      if (widget.isValidateInput) {
        widget.rewardCallback(
            _bidderService.calculateReward(widget.userBid, winChance));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SliderButton(
            icon: Icon(
              Icons.exposure_neg_1,
              color: ktextRedColor,
            ),
            onPress: () {
              setState(() {
                if (winChance > 0.02) {
                  winChance -= 0.01;
                  updateSlider(winChance);
                }
              });
            },
          ),
          Expanded(
            child: NeumorphicSlider(
              style: SliderStyle(
                border: NeumorphicBorder(width: 4),
                accent: Colors.amberAccent,
                variant: Colors.amber[100],
                depth: -3,
                thumbBorder: NeumorphicBorder(
                  color: Colors.black12,
                  width: 5,
                ),
                lightSource: LightSource.topLeft,
              ),
              value: winChance,
              min: 0.01,
              max: 0.99,
              onChanged: (value) {
                setState(() {
                  updateSlider(value);
                });
              },
            ),
          ),
          SliderButton(
            icon: Icon(
              Icons.exposure_plus_1,
              color: ktextGreenColor,
            ),
            onPress: () {
              setState(() {
                if (winChance < 0.99) {
                  winChance += 0.01;
                  updateSlider(winChance);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
