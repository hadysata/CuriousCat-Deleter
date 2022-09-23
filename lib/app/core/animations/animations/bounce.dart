import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Bounce extends StatefulWidget {
  VoidCallback? onTap;
  final Widget child;
  Duration duration;
  final bool enabled;

  Bounce(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 900),
      required this.onTap,
      this.enabled = true})
      : super(key: key);

  @override
  BounceState createState() => BounceState();
}

class BounceState extends State<Bounce> with SingleTickerProviderStateMixin {
  late double _scale;

  late AnimationController _animate;

  VoidCallback? get onPressed => widget.onTap;

  Duration get userDuration => widget.duration;

  late Duration onTapDownDuration;

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
          if (widget.enabled) {
            HapticFeedback.heavyImpact();
            _start(userDuration);

            if (onPressed != null) {
              onPressed!();
            }
          }
        },
        onTapDown: (details) => widget.enabled ? _start(onTapDownDuration) : null,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }

  Future<void> _start(Duration duration) async {
    _animate.forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted && _animate.status != AnimationStatus.dismissed) _animate.reverse();
    });
  }
}
