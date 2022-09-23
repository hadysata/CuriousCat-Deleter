import 'package:flutter/cupertino.dart';

class BottomSlideTransition extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  const BottomSlideTransition({Key? key, this.child, this.duration = const Duration(milliseconds: 300)})
      : super(key: key);

  @override
  BottomSlideTransitionState createState() => BottomSlideTransitionState();
}

class BottomSlideTransitionState extends State<BottomSlideTransition> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(_controller!);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation!, child: widget.child);
  }
}
