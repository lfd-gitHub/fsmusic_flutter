import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final int count;
  final double size;
  final double borderWidth;
  final EdgeInsets childPadding;

  const Badge({
    Key? key,
    required this.child,
    this.size = 18,
    this.count = 10,
    this.borderWidth = 2,
    this.childPadding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: childPadding,
          child: child,
        ),
        Positioned(
          right: size / 8,
          top: size / 8,
          child: Container(
            constraints: BoxConstraints(minWidth: size, minHeight: size),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(color: Colors.white, width: borderWidth),
              borderRadius: BorderRadius.circular(size),
            ),
            child: Center(
              child: FText("${count > 99 ? '99+' : count}",
                  size: size / 2,
                  color: Colors.white,
                  textAlign: TextAlign.center),
            ),
          ),
        )
      ],
    );
  }
}
