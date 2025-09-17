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
  // 1. White / Light Grey (base)
  LinearGradient(
    colors: [
      const Color(0xFFFFFFFF).withValues(alpha: 0.95),
      const Color(0xFFF5F5F5).withValues(alpha: 0.95),
      const Color(0xFFEAEAEA).withValues(alpha: 0.95),
      const Color(0xFFDDDDDD).withValues(alpha: 0.95),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  // 2. Soft Charcoal Grey
  LinearGradient(
    colors: [
      const Color(0xFFF0F0F0).withValues(alpha: 0.95),
      const Color(0xFFE6E6E6).withValues(alpha: 0.95),
      const Color(0xFFD9D9D9).withValues(alpha: 0.95),
      const Color(0xFFCCCCCC).withValues(alpha: 0.95),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),

  // 3. Turquoise (light teal tone)
  LinearGradient(
    colors: [
      const Color(0xFFE0FFFF).withValues(alpha: 0.95),
      const Color(0xFFB2DFDB).withValues(alpha: 0.95),
      const Color(0xFF80CBC4).withValues(alpha: 0.95),
      const Color(0xFF4DB6AC).withValues(alpha: 0.95),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),

  // 4. Light Blue
  LinearGradient(
    colors: [
      const Color(0xFFE3F2FD).withValues(alpha: 0.95),
      const Color(0xFFBBDEFB).withValues(alpha: 0.95),
      const Color(0xFF90CAF9).withValues(alpha: 0.95),
      const Color(0xFF64B5F6).withValues(alpha: 0.95),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),

  // 5. Red
  LinearGradient(
    colors: [
      const Color(0xFFFFEBEE).withValues(alpha: 0.95),
      const Color(0xFFFFCDD2).withValues(alpha: 0.95),
      const Color(0xFFEF9A9A).withValues(alpha: 0.95),
      const Color(0xFFE57373).withValues(alpha: 0.95),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),

  // 6. Purple
  LinearGradient(
    colors: [
      const Color(0xFFF3E5F5).withValues(alpha: 0.95),
      const Color(0xFFE1BEE7).withValues(alpha: 0.95),
      const Color(0xFFCE93D8).withValues(alpha: 0.95),
      const Color(0xFFBA68C8).withValues(alpha: 0.95),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),

  // 7. Deep Orange
  LinearGradient(
    colors: [
      const Color(0xFFFFF3E0).withValues(alpha: 0.95),
      const Color(0xFFFFE0B2).withValues(alpha: 0.95),
      const Color(0xFFFFCC80).withValues(alpha: 0.95),
      const Color(0xFFFFB74D).withValues(alpha: 0.95),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.topRight,
  ),

  // 8. Brown (symmetric)
  LinearGradient(
    colors: [
      const Color(0xFFFFF8E1).withValues(alpha: 0.95),
      const Color(0xFFD7CCC8).withValues(alpha: 0.95),
      const Color(0xFFBCAAA4).withValues(alpha: 0.95),
      const Color(0xFFD7CCC8).withValues(alpha: 0.95),
      const Color(0xFFFFF8E1).withValues(alpha: 0.95),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),

  // 9. Green
  LinearGradient(
    colors: [
      const Color(0xFFE8F5E9).withValues(alpha: 0.95),
      const Color(0xFFC8E6C9).withValues(alpha: 0.95),
      const Color(0xFFA5D6A7).withValues(alpha: 0.95),
      const Color(0xFF81C784).withValues(alpha: 0.95),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ),

  // 10. Cyan
  LinearGradient(
    colors: [
      const Color(0xFFE0F7FA).withValues(alpha: 0.95),
      const Color(0xFFB2EBF2).withValues(alpha: 0.95),
      const Color(0xFF80DEEA).withValues(alpha: 0.95),
      const Color(0xFF4DD0E1).withValues(alpha: 0.95),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
];

  static final List<LinearGradient> _darkGradients = [
  // 1. Black (classic, base)
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

  // 2. Charcoal Grey
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

  // 3. Turquoise (dark teal tone)
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

  // 4. Dark Blue
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

  // 5. Red (darker)
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

  // 6. Purple (darker)
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

  // 7. Deep Orange
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

  // 8. Brown (symmetric: start & end same)
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

  // 9. Dark Green (darker)
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

  // 10. Dark Cyan (darker)
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
  Color.fromARGB(255, 173, 172, 172), // 6 - Black
  Color(0xFF008080), // 0 - Turquoise
  Color(0xFF0D47A1), // 1 - Dark Blue
  Color(0xFFB71C1C), // 2 - Red
  Color(0xFF6A1B9A), // 3 - Purple
  Color.fromARGB(255, 173, 172, 172), // 6 - Black
  Color(0xFFE65100), // 4 - Deep Orange
  Color(0xFF4E342E), // 5 - Brown
  Color(0xFF006400), // 8 - Dark Green
  Color(0xFF00BCD4), // 9 - Cyan
];

  static Color getFixedColors(int index)
  {
    return darkFixedColors[index];
  }


}
