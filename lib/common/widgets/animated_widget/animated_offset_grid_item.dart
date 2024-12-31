import 'package:flutter/material.dart';

class AnimatedOffsetGridItem extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final VoidCallback onRemove;

  const AnimatedOffsetGridItem({
    super.key,
    required this.child,
    required this.isVisible,
    required this.onRemove,
  });

  @override
  State<AnimatedOffsetGridItem> createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<AnimatedOffsetGridItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.isVisible) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedOffsetGridItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && !_animationController.isCompleted) {
      _animationController.forward();
    } else if (!widget.isVisible && _animationController.isCompleted) {
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
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}
