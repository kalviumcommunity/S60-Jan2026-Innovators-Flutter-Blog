import 'package:flutter/material.dart';

/// A reusable stateful like/favorite button widget.
/// This demonstrates how to create stateful widgets that manage their own state
/// and can be reused in multiple places while maintaining independent state.
class LikeButton extends StatefulWidget {
  final VoidCallback? onLikeChanged;
  final double iconSize;
  final Color likedColor;
  final Color unlikedColor;

  const LikeButton({
    super.key,
    this.onLikeChanged,
    this.iconSize = 28,
    this.likedColor = Colors.red,
    this.unlikedColor = Colors.grey,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    widget.onLikeChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
      ),
      child: IconButton(
        icon: Icon(
          _isLiked ? Icons.favorite : Icons.favorite_border,
          color: _isLiked ? widget.likedColor : widget.unlikedColor,
          size: widget.iconSize,
        ),
        onPressed: _toggleLike,
        splashRadius: 20,
      ),
    );
  }
}
