import 'package:flutter/material.dart';

class RainbowCursorWrapper extends StatefulWidget
{
  final Widget child;
  final double size;

  const RainbowCursorWrapper({super.key, required this.child, this.size = 10});

  @override
  State<RainbowCursorWrapper> createState() => _RainbowCursorWrapperState();
}

class _RainbowCursorWrapperState extends State<RainbowCursorWrapper> with SingleTickerProviderStateMixin
{
  Offset position = Offset.zero;
  late AnimationController _controller;

  @override
  void initState()
  {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  Color getColor(double value)
  {
    return HSVColor.fromAHSV(1, value * 360, 1, 1).toColor();
  }

  @override
  Widget build(BuildContext context)
  {
    return MouseRegion(
      // cursor: SystemMouseCursors.defer,
      onExit: (_) => setState(() => position = Offset.zero),
      onHover: (event) => setState(() => position = event.position),
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child, // entire page inside this wrapper
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child)
            {
              return Positioned(
                left: position.dx - widget.size / 2,
                top: position.dy - widget.size / 2,
                child: IgnorePointer(
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: getColor(_controller.value),
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: getColor(_controller.value).withValues(alpha: 0.5), blurRadius: 10)]
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
