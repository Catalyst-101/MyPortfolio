import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/external_widgets/bouncing_image_profile.dart';
import 'package:portfolio/desktop/external_widgets/link.dart';
import 'package:portfolio/desktop/helper_classes/responsive_layout.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const AboutMeMobile(),
      tablet: const AboutMeDesktopTablet(),
      desktop: const AboutMeDesktopTablet(),
    );
  }
}

class AboutMeDesktopTablet extends StatelessWidget {
  const AboutMeDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth < 900;

    return Container(
      margin: EdgeInsets.symmetric(vertical: isTablet ? 40 : 60, horizontal: isTablet ? 20 : 40),
      padding: EdgeInsets.all(isTablet ? 20 : 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.5),
            const Color(0xFF2C2C2C).withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Little About Me",
                  style: TextStyle(
                    fontSize: isTablet ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "I’m a curious Computer Science student who loves solving problems "
                  "through design and code. My interests range from Flutter and "
                  "full-stack web development to experimenting with AI and creative tech. "
                  "I believe in building clean, engaging experiences that connect ideas "
                  "to people in a meaningful way.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: isTablet ? 14 : 18,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 20 : 28,
                      vertical: isTablet ? 12 : 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "More Info About Me",
                    style: TextStyle(fontSize: isTablet ? 14 : 16),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Link(icon: FontAwesomeIcons.github, onPressed: () {}),
                    const SizedBox(width: 12),
                    Link(icon: FontAwesomeIcons.linkedinIn, onPressed: () {}),
                    const SizedBox(width: 12),
                    Link(icon: Icons.email, onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: isTablet ? 20 : 40),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: BouncingProfileImage(
                height: isTablet ? 200 : 250,
                width: isTablet ? 200 : 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.5),
            const Color(0xFF2C2C2C).withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BouncingProfileImage(height: 180, width: 180),
          const SizedBox(height: 20),
          const Text(
            "A Little About Me",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            "I’m a curious Computer Science student who loves solving problems "
            "through design and code. My interests range from Flutter and "
            "full-stack web development to experimenting with AI and creative tech. "
            "I believe in building clean, engaging experiences that connect ideas "
            "to people in a meaningful way.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("More Info About Me", style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Link(icon: FontAwesomeIcons.github, onPressed: () {}),
              const SizedBox(width: 12),
              Link(icon: FontAwesomeIcons.linkedinIn, onPressed: () {}),
              const SizedBox(width: 12),
              Link(icon: Icons.email, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
