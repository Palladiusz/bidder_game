import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SliderWidget extends StatelessWidget {
  final Function(double) onChangeCallback;
  final double value;

  final Stream<double> stream;

  const SliderWidget({Key key, this.onChangeCallback, this.value, this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<double>(
          stream: stream,
          builder: (context, snapshot) {
            return NeumorphicSlider(
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
              value: snapshot.data ?? 0,
              min: 0.01,
              max: 0.99,
              onChanged: onChangeCallback,
            );
          }),
    );
  }
}
