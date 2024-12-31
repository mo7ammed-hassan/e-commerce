import 'package:flutter/material.dart';

class AnimatedFadeGridItem extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final VoidCallback onRemove;

  const AnimatedFadeGridItem({
    super.key,
    required this.child,
    required this.isVisible,
    required this.onRemove,
  });

  @override
  State<AnimatedFadeGridItem> createState() => _AnimatedFadeGridItemState();
}

class _AnimatedFadeGridItemState extends State<AnimatedFadeGridItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedFadeGridItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse().then((_) => widget.onRemove());
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: widget.child,
    );
  }
}
