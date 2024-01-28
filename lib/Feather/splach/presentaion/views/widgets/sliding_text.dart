import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'I have an easier life',
              style: Styles.textStyle16.copyWith(
                color:
                    Theme.of(context).colorScheme.brightness == Brightness.dark
                        ? Colors.white
                        : scoundColor,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
