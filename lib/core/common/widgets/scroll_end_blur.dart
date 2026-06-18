// reusable widget to overlay a subtle fade gradient at the end of a horizontal list
import 'package:flutter/material.dart';

class ScrollEndBlur extends StatelessWidget {
  final Widget child;
  final double width;
  final Color overlayColor;

  const ScrollEndBlur({
    super.key,
    required this.child,
    this.width = 60,
    this.overlayColor = const Color(0x99000000),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          width: width,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.transparent, overlayColor],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
