import 'package:flutter/material.dart';

class GradientPalette {
  final int index;
  final bool isDark;

  GradientPalette({required this.index, this.isDark = false});

  Gradient get gradient {
    final gradients = isDark ? _darkGradients : _lightGradients;
    final safeIndex = index % gradients.length;
    return gradients[safeIndex];
  }

  static final List<LinearGradient> _lightGradients = [
    LinearGradient(
      colors: [
        const Color(0xFFE6E6E6).withValues(alpha: 0.95),
        const Color(0xFFDADADA).withValues(alpha: 0.95),
        const Color(0xFFCECECE).withValues(alpha: 0.95),
        const Color(0xFFC2C2C2).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFDADADA).withValues(alpha: 0.95),
        const Color(0xFFCECECE).withValues(alpha: 0.95),
        const Color(0xFFC2C2C2).withValues(alpha: 0.95),
        const Color(0xFFB6B6B6).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFCFEFEF).withValues(alpha: 0.95),
        const Color(0xFF9FD8D4).withValues(alpha: 0.95),
        const Color(0xFF6FBFB7).withValues(alpha: 0.95),
        const Color(0xFF4DA8A0).withValues(alpha: 0.95),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFCBDDF0).withValues(alpha: 0.95),
        const Color(0xFFAFC9E8).withValues(alpha: 0.95),
        const Color(0xFF8FB3DD).withValues(alpha: 0.95),
        const Color(0xFF6A9FD2).withValues(alpha: 0.95),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFF2C7C7).withValues(alpha: 0.95),
        const Color(0xFFE3A8A8).withValues(alpha: 0.95),
        const Color(0xFFD98888).withValues(alpha: 0.95),
        const Color(0xFFCC6F6F).withValues(alpha: 0.95),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFE1CFE8).withValues(alpha: 0.95),
        const Color(0xFFD0B3DD).withValues(alpha: 0.95),
        const Color(0xFFBB95CF).withValues(alpha: 0.95),
        const Color(0xFFA97AC0).withValues(alpha: 0.95),
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFF0D6B8).withValues(alpha: 0.95),
        const Color(0xFFE6BE91).withValues(alpha: 0.95),
        const Color(0xFFD9A56B).withValues(alpha: 0.95),
        const Color(0xFFCC8E4D).withValues(alpha: 0.95),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFE6DACF).withValues(alpha: 0.95),
        const Color(0xFFCBB9A9).withValues(alpha: 0.95),
        const Color(0xFFB49C8D).withValues(alpha: 0.95),
        const Color(0xFFCBB9A9).withValues(alpha: 0.95),
        const Color(0xFFE6DACF).withValues(alpha: 0.95),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFD3E8D6).withValues(alpha: 0.95),
        const Color(0xFFB5D6BC).withValues(alpha: 0.95),
        const Color(0xFF94C49F).withValues(alpha: 0.95),
        const Color(0xFF75B284).withValues(alpha: 0.95),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    LinearGradient(
      colors: [
        const Color(0xFFCBE6EA).withValues(alpha: 0.95),
        const Color(0xFFA8D5DD).withValues(alpha: 0.95),
        const Color(0xFF84C3CF).withValues(alpha: 0.95),
        const Color(0xFF63B1C1).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  static final List<LinearGradient> _darkGradients = [
    LinearGradient(
      colors: [
        const Color(0xFF000000).withValues(alpha: 0.95),
        const Color(0xFF0A0A0A).withValues(alpha: 0.95),
        const Color(0xFF121212).withValues(alpha: 0.95),
        const Color(0xFF1C1C1C).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF1A1A1A).withValues(alpha: 0.95),
        const Color(0xFF242424).withValues(alpha: 0.95),
        const Color(0xFF2E2E2E).withValues(alpha: 0.95),
        const Color(0xFF383838).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF001010).withValues(alpha: 0.95),
        const Color(0xFF002222).withValues(alpha: 0.95),
        const Color(0xFF003333).withValues(alpha: 0.95),
        const Color(0xFF004444).withValues(alpha: 0.95),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF000814).withValues(alpha: 0.95),
        const Color(0xFF001526).withValues(alpha: 0.95),
        const Color(0xFF002244).withValues(alpha: 0.95),
        const Color(0xFF003355).withValues(alpha: 0.95),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF0D0000).withValues(alpha: 0.95),
        const Color(0xFF1A0000).withValues(alpha: 0.95),
        const Color(0xFF330000).withValues(alpha: 0.95),
        const Color(0xFF440000).withValues(alpha: 0.95),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF0D001A).withValues(alpha: 0.95),
        const Color(0xFF1A0033).withValues(alpha: 0.95),
        const Color(0xFF26004D).withValues(alpha: 0.95),
        const Color(0xFF330066).withValues(alpha: 0.95),
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF1A0E00).withValues(alpha: 0.95),
        const Color(0xFF331C00).withValues(alpha: 0.95),
        const Color(0xFF662E00).withValues(alpha: 0.95),
        const Color(0xFF993D00).withValues(alpha: 0.95),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF1A0D00).withValues(alpha: 0.95),
        const Color(0xFF331A00).withValues(alpha: 0.95),
        const Color(0xFF4D2600).withValues(alpha: 0.95),
        const Color(0xFF331A00).withValues(alpha: 0.95),
        const Color(0xFF1A0D00).withValues(alpha: 0.95),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.topRight,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF001000).withValues(alpha: 0.95),
        const Color(0xFF002200).withValues(alpha: 0.95),
        const Color(0xFF003300).withValues(alpha: 0.95),
        const Color(0xFF004400).withValues(alpha: 0.95),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    LinearGradient(
      colors: [
        const Color(0xFF001018).withValues(alpha: 0.95),
        const Color(0xFF002030).withValues(alpha: 0.95),
        const Color(0xFF003348).withValues(alpha: 0.95),
        const Color(0xFF004460).withValues(alpha: 0.95),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  static final List<Color> darkFixedColors = [
    Color.fromARGB(255, 173, 172, 172),
    Color(0xFF008080),
    Color(0xFF0D47A1),
    Color(0xFFB71C1C),
    Color(0xFF6A1B9A),
    Color.fromARGB(255, 173, 172, 172),
    Color(0xFFE65100),
    Color(0xFF4E342E),
    Color(0xFF006400),
    Color(0xFF00BCD4),
  ];

  static Color getFixedColors(int index) {
    return darkFixedColors[index];
  }
}
