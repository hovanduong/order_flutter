import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class WidgetAnimationStaggeredItem extends StatelessWidget {
  final int index;
  final Widget child;

  const WidgetAnimationStaggeredItem(
      {@required this.index, @required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 350),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(child: child),
      ),
    );
    ;
  }
}
