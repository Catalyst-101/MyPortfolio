import 'package:flutter/material.dart';

class TechnicalSkills extends StatelessWidget {
  const TechnicalSkills({super.key});

  Widget skillBox(String title, List<Widget> skills) {
    return _HoverSkillBox(title: title, skills: skills);
  }

  @override
  Widget build(BuildContext context) {
    Widget skillChip(String text) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Technical Skills",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "A comprehensive overview of my technical expertise and tools I work with",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: skillBox("Programming Languages", [
                    skillChip("C++"),
                    skillChip("Python"),
                    skillChip("Java"),
                    skillChip("Dart"),
                  ])),
                  const SizedBox(width: 20),
                  Expanded(child: skillBox("Front-End Development", [
                    skillChip("HTML"),
                    skillChip("CSS"),
                    skillChip("JavaScript"),
                    skillChip("Flutter"),
                    skillChip("XML"),
                    skillChip("JavaFX"),
                  ])),
                  const SizedBox(width: 20),
                  Expanded(child: skillBox("Back-End Development", [
                    skillChip("Flask"),
                    skillChip("JDBC"),
                    skillChip("Firebase"),
                  ])),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: skillBox("Databases & Cloud Storage", [
                    skillChip("MySQL"),
                    skillChip("PostgreSQL"),
                    skillChip("Firebase Storage"),
                    skillChip("NoSQL"),
                  ])),
                  const SizedBox(width: 20),
                  Expanded(child: skillBox("App Development", [
                    skillChip("Flutter"),
                    skillChip("Kotlin"),
                    skillChip("Java")
                  ])),
                  const SizedBox(width: 20),
                  Expanded(child: skillBox("Other Tools", [
                    skillChip("VS Code"),
                    skillChip("Intellije"),
                    skillChip("Android Studio"),
                    skillChip("Git"),
                    skillChip("GitHub"),
                  ])),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _HoverSkillBox extends StatefulWidget {
  final String title;
  final List<Widget> skills;
  const _HoverSkillBox({required this.title, required this.skills});

  @override
  State<_HoverSkillBox> createState() => _HoverSkillBoxState();
}

class _HoverSkillBoxState extends State<_HoverSkillBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: isHovered
            ? Matrix4.translationValues(0, -8, 0)
            : Matrix4.identity(),

        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.skills,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
