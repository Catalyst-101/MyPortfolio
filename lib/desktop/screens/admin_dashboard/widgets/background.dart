import 'package:flutter/material.dart';
import 'package:portfolio/desktop/utilities/gradient_pallete.dart';
import 'package:portfolio/desktop/external_widgets/falling_particles.dart';
import 'package:portfolio/desktop/external_widgets/rainbow_cursor_wrapper.dart';

class Background extends StatelessWidget {
  final List<Widget> children;
  final double maxWidth;
  final double maxHeight;

  const Background({
    super.key,
    required this.children,
    this.maxWidth = 1300,
    this.maxHeight = 600,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double width = size.width.clamp(0, maxWidth);
    final double height = size.height.clamp(0, maxHeight);

    return RainbowCursorWrapper(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/coding_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: GradientPalette(index: 0, isDark: true).gradient,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      FallingParticles(numberOfParticles: 200),
                      Container(
                        color: Colors.black.withValues(alpha: 0.2),
                        child: Row(
                          children: children,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
