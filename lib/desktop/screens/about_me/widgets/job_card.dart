import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatefulWidget {
  final String roleTitle;       // e.g., Software Engineering Intern
  final String companyName;     // e.g., Code Alpha
  final String workMode;        // e.g., Remote
  final String duration;        // e.g., Jun 2024 - Aug 2024
  final List<String> highlights; // bullet points
  final String image; // path to certificate image
  final String certificateLink;  // link to view certificate

  const ExperienceCard({
    super.key,
    required this.roleTitle,
    required this.companyName,
    required this.workMode,
    required this.duration,
    required this.highlights,
    required this.image,
    required this.certificateLink,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.translationValues(0, -6, 0) // float effect
            : Matrix4.identity(),
        curve: Curves.easeOut,
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF1E1E1E),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [

            // Left Side (Details)
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Role Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.roleTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.companyName,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                    const SizedBox(height: 15),

                    // Work Mode + Duration
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            color: Colors.white60, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          widget.workMode,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          widget.duration,
                          style: const TextStyle(
                              color: Colors.white60, fontSize: 12),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Highlights (bullets)
                    ...widget.highlights.map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("→ ",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                            Expanded(
                              child: Text(
                                point,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right Side (Certificate preview)
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Stack(
                  children: [
                    AnimatedScale(
                      scale: _isHovered ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 400),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Container(
                      color: Colors.black.withValues(alpha: 0.4),
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                           final uri = Uri.parse(widget.certificateLink);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri, mode: LaunchMode.externalApplication);
                              }
                          },
                          icon: const Icon(Icons.open_in_new, size: 14),
                          label: const Text("View Certificate"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            textStyle: const TextStyle(fontSize: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
