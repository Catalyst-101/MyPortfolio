import 'dart:math';
import 'package:flutter/material.dart';

class FallingParticles extends StatefulWidget {
  final int numberOfParticles;

  const FallingParticles({
    super.key,
    this.numberOfParticles = 80,
  });

  @override
  State<FallingParticles> createState() => _FallingParticlesState();
}

class _FallingParticlesState extends State<FallingParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;
  final random = Random();

  @override
  void initState() {
    super.initState();

    particles = List.generate(widget.numberOfParticles, (_) {
      return Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 8 + 6,
        speed: random.nextDouble() * 0.002 + 0.001,
        shape: ParticleShape.values[random.nextInt(ParticleShape.values.length)],
        color: Color.fromARGB(20, 255, 255, 255)
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(hours: 1),
    )..addListener(() {
        setState(() {
          for (var p in particles) {
            p.y += p.speed;
            if (p.y > 1) p.y = 0; // reset to top
          }
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlePainter(particles),
      size: Size.infinite,
    );
  }
}

enum ParticleShape { circle, square, triangle, star }

class Particle {
  double x;
  double y;
  double size;
  double speed;
  ParticleShape shape;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.shape,
    required this.color,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      final offset = Offset(p.x * size.width, p.y * size.height);
      final paint = Paint()..color = p.color;

      switch (p.shape) {
        case ParticleShape.circle:
          canvas.drawCircle(offset, p.size / 2, paint);
          break;
        case ParticleShape.square:
          canvas.drawRect(
            Rect.fromCenter(center: offset, width: p.size, height: p.size),
            paint,
          );
          break;
        case ParticleShape.triangle:
          _drawTriangle(canvas, offset, p.size, paint);
          break;
        case ParticleShape.star:
          _drawStar(canvas, offset, p.size, paint);
          break;
      }
    }
  }

  void _drawTriangle(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    path.moveTo(center.dx, center.dy - size / 2); // top
    path.lineTo(center.dx - size / 2, center.dy + size / 2); // bottom left
    path.lineTo(center.dx + size / 2, center.dy + size / 2); // bottom right
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawStar(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    const points = 5;
    final outerRadius = size / 2;
    final innerRadius = outerRadius / 2.5;
    for (int i = 0; i < points * 2; i++) {
      final isEven = i.isEven;
      final radius = isEven ? outerRadius : innerRadius;
      final angle = (pi / points) * i;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
