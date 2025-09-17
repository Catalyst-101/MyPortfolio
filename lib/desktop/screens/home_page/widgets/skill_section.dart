import 'package:flutter/material.dart';
import 'package:portfolio/desktop/helper_classes/responsive_layout.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final boxShadow = [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 20,
        offset: Offset(0, 10),
      )
    ];

    return ResponsiveLayout(
      mobile: SkillsMobile(boxShadow: boxShadow),
      tablet: SkillsTablet(boxShadow: boxShadow),
      desktop: SkillsDesktop(boxShadow: boxShadow),
    );

  }
}

// ---------------- DESKTOP ----------------
class SkillsDesktop extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  const SkillsDesktop({super.key, required this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      decoration: _bgDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _sectionTitle(),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: SkillBox(
                  icon: Icons.devices,
                  title: "Cross-Platform Dev",
                  description: "Build Web and Mobile Apps using Flutter.",
                  boxShadow: boxShadow,
                  height: 250,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SkillBox(
                  icon: Icons.phone_android,
                  title: "App Development",
                  description:
                      "Develop responsive and high-performance mobile applications.",
                  boxShadow: boxShadow,
                  height: 250,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SkillBox(
                  icon: Icons.design_services,
                  title: "UI/UX Designer",
                  description:
                      "Design intuitive and modern user interfaces and experiences.",
                  boxShadow: boxShadow,
                  height: 250,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- TABLET ----------------
class SkillsTablet extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  const SkillsTablet({super.key, required this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: _bgDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _sectionTitle(),
          const SizedBox(height: 30),
          Column(
            children: [
              SkillBox(
                icon: Icons.devices,
                title: "Cross-Platform Dev",
                description: "Build Web and Mobile Apps using Flutter.",
                boxShadow: boxShadow,
                height: 230,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              SkillBox(
                icon: Icons.phone_android,
                title: "App Development",
                description:
                    "Develop responsive and high-performance mobile applications.",
                boxShadow: boxShadow,
                height: 230,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              SkillBox(
                icon: Icons.design_services,
                title: "UI/UX Designer",
                description:
                    "Design intuitive and modern user interfaces and experiences.",
                boxShadow: boxShadow,
                height: 230,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- MOBILE ----------------
class SkillsMobile extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  const SkillsMobile({super.key, required this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: _bgDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _sectionTitle(fontSize: 28),
          const SizedBox(height: 20),
          Column(
            children: [
              SkillBox(
                icon: Icons.devices,
                title: "Cross-Platform Dev",
                description: "Build Web and Mobile Apps using Flutter.",
                boxShadow: boxShadow,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              SkillBox(
                icon: Icons.phone_android,
                title: "App Development",
                description:
                    "Develop responsive and high-performance mobile applications.",
                boxShadow: boxShadow,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
              SkillBox(
                icon: Icons.design_services,
                title: "UI/UX Designer",
                description:
                    "Design intuitive and modern user interfaces and experiences.",
                boxShadow: boxShadow,
                margin: const EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- SKILL BOX ----------------
class SkillBox extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<BoxShadow> boxShadow;
  final double? height;
  final EdgeInsetsGeometry? margin;

  const SkillBox({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.boxShadow,
    this.height,
    this.margin,
  });

  @override
  State<SkillBox> createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          height: widget.height ?? null, // keep if passed, else dynamic
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          transform: isHovered
              ? Matrix4.translationValues(0, -10, 0)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF2C2C2C).withValues(alpha: 0.9),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            boxShadow: isHovered ? widget.boxShadow : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // allows dynamic height
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 50, color: Colors.deepOrangeAccent),
              const SizedBox(height: 20),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14, color: Colors.white70, height: 1.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- HELPERS ----------------
BoxDecoration _bgDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.black.withValues(alpha: 0.5),
        const Color(0xFF2C2C2C).withValues(alpha: 0.5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}

Widget _sectionTitle({double fontSize = 40}) {
  return Column(
    children: [
      Text(
        "What I'm Capable of",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        "I mainly focus on cross-platform development, web & mobile app development, and UI/UX design.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
        ),
      ),
    ],
  );
}
