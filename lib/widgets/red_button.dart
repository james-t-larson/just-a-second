import 'package:flutter/material.dart';

class RedButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;
  final bool isLarge;

  const RedButton({
    Key? key,
    required this.label,
    this.onTap,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.isLarge = false,
  }) : super(key: key);

  @override
  State<RedButton> createState() => _RedButtonState();
}

class _RedButtonState extends State<RedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onLongPressStart?.call();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onLongPressEnd?.call();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onLongPressEnd?.call();
      },
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          width: widget.isLarge ? 240 : 180,
          height: widget.isLarge ? 240 : 180,
          decoration: BoxDecoration(
            color: Colors.red.shade600,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade900.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
