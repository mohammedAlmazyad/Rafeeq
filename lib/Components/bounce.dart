library flutter_bounce;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Bounce extends StatefulWidget {
  VoidCallback onTap;
  final Widget child;
  Duration duration;
  Bounce({@required this.child, @required this.duration, @required this.onTap}) : assert(child != null) {
    if (duration == null) duration = Duration(milliseconds: 50);
  }

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  double _scale;

  AnimationController _animate;

  VoidCallback get onPressed => widget.onTap;

  Duration get userDuration => widget.duration;

  Duration onTapDownDuration;

  @override
  void initState() {
    _animate =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 50), lowerBound: 0.0, upperBound: 0.1)
          ..addListener(() {
            setState(() {});
          });
    onTapDownDuration = Duration(milliseconds: userDuration.inMilliseconds + 150);
    super.initState();
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return GestureDetector(
        onTap: () async {
          await HapticFeedback.heavyImpact();
          _start(userDuration);
          if (onPressed != null && _animate != null) onPressed();
        },
        onTapDown: (details) => _start(onTapDownDuration),
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }

  Future<void> _start(Duration duration) async {
    _animate.forward();

    Future.delayed(duration != null ? duration : Duration(milliseconds: 100), () {
      if (_animate.status != AnimationStatus.dismissed) _animate.reverse();
    });
  }
}
