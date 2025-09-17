import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/helper_classes/responsive_layout.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ResponsiveLayout(
      mobile: const CustomFooterMobile(),
      desktop: const CustomFooterDesktop(),
      tablet: const CustomFooterMobile(),
    );
  }
}


class CustomFooterDesktop extends StatelessWidget
{
  const CustomFooterDesktop({super.key});

  @override
  Widget build(BuildContext context)
  {
    final year = DateTime.now().year.toString().substring(2);

    return Container(
      color: const Color(0xFF0E0E0E),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "KHAN BHAI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                children: [
                  footerLink("Home", "https://example.com/home"),
                  footerLink("My Projects", "https://example.com/projects"),
                  footerLink("Khan News", "https://example.com/news"),
                  footerLink("FAQs", "https://example.com/faqs"),
                  footerLink("About Me", "https://example.com/about"),
                  footerLink("Contact Me", "https://example.com/contact"),
                ],
              ),

              Row(
                children: [
                  socialIcon(FontAwesomeIcons.github, "https://github.com/"),
                  const SizedBox(width: 15),
                  socialIcon(FontAwesomeIcons.linkedin, "https://linkedin.com/"),
                  const SizedBox(width: 15),
                  socialIcon(Icons.email, "mailto:someone@example.com"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "© 20$year Khan Bhai. All Rights Reserved.",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Row(
                children: [
                  footerLink("Privacy & Policy", "https://example.com/privacy"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.flutter, color: Colors.white, size: 18),
              SizedBox(width: 6),
              Text(
                "Powered by Flutter",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget footerLink(String text, String url)
  {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget socialIcon(IconData icon, String url)
  {
    return InkWell(
      onTap: () {},
      child: Icon(
        icon,
        color: Colors.white70,
        size: 20,
      ),
    );
  }
}

class CustomFooterMobile extends StatelessWidget {
  const CustomFooterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year.toString().substring(2);

    return Container(
      color: const Color(0xFF0E0E0E),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "KHAN BHAI",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Column(
            children: [
              footerLink("Home", "https://example.com/home"),
              footerLink("My Projects", "https://example.com/projects"),
              footerLink("Khan News", "https://example.com/news"),
              footerLink("FAQs", "https://example.com/faqs"),
              footerLink("About Me", "https://example.com/about"),
              footerLink("Contact Me", "https://example.com/contact"),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon(FontAwesomeIcons.github, "https://github.com/"),
              const SizedBox(width: 15),
              socialIcon(FontAwesomeIcons.linkedin, "https://linkedin.com/"),
              const SizedBox(width: 15),
              socialIcon(Icons.email, "mailto:someone@example.com"),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white24),

          const SizedBox(height: 10),

          Text(
            "© 20$year Khan Bhai. All Rights Reserved.",
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          footerLink("Privacy & Policy", "https://example.com/privacy"),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.flutter, color: Colors.white, size: 18),
              SizedBox(width: 6),
              Text(
                "Powered by Flutter",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget footerLink(String text, String url) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {},
      child: Icon(
        icon,
        color: Colors.white70,
        size: 20,
      ),
    );
  }
}

