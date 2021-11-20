import 'package:flutter/cupertino.dart';

class BottomSlideTransition extends StatefulWidget {
  final Widget child;
  const BottomSlideTransition({Key? key, required this.child}) : super(key: key);

  @override
  _BottomSlideTransitionState createState() => _BottomSlideTransitionState();
}

class _BottomSlideTransitionState extends State<BottomSlideTransition> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation, child: widget.child);
  }
}
