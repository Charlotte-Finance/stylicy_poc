
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';


class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 40,
      child: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.ballPulseSync,
            colors: [Colors.black, Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.5), ],
            strokeWidth: 0.0,
            pathBackgroundColor:
            Colors.black45
        ),
      ),
    );
  }
}
