import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/helper_classes/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const CustomFooterMobile(),
      desktop: const CustomFooterDesktop(),
      tablet: const CustomFooterMobile(),
    );
  }
}

class CustomFooterDesktop extends StatelessWidget {
  const CustomFooterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
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
                  footerLink(context, "Home", "/"),
                  footerLink(context, "My Projects", "/myprojects"),
                  footerLink(context, "FAQs", "/faqs"),
                  footerLink(context, "About Me", "/aboutme"),
                  footerLink(context, "Contact Me", "/contact"),
                ],
              ),
              Row(
                children: [
                  socialIcon(FontAwesomeIcons.github, "https://github.com/Catalyst-101"),
                  const SizedBox(width: 15),
                  socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/smk-cs24/"),
                  const SizedBox(width: 15),
                  socialIcon(Icons.email, "https://mail.google.com/mail/?view=cm&fs=1&to=skyisblack95@gmail.com&su=Hello%20there&body=Hi%20there"),
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
                  footerLink(context, "Privacy & Policy", "https://example.com/privacy"),
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

  Widget footerLink(BuildContext context, String text, String url) {
    return InkWell(
      onTap: () async {
        if (url.startsWith('/')) {
          Navigator.pushNamed(context, url); // internal route
        } else {
          final uri = Uri.parse(url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            debugPrint('Could not launch $url');
          }
        }
      },
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

  Widget socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          debugPrint('Could not launch $url');
        }
      },
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
              footerLink(context, "Home", "/"),
              footerLink(context, "My Projects", "/myprojects"),
              footerLink(context, "FAQs", "/faqs"),
              footerLink(context, "About Me", "/aboutme"),
              footerLink(context, "Contact Me", "/contact"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon(FontAwesomeIcons.github, "https://github.com/Catalyst-101"),
              const SizedBox(width: 15),
              socialIcon(FontAwesomeIcons.linkedin, "https://www.linkedin.com/in/smk-cs24/"),
              const SizedBox(width: 15),
              socialIcon(Icons.email, "https://mail.google.com/mail/?view=cm&fs=1&to=skyisblack95@gmail.com&su=Hello%20there&body=Hi%20there"),
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
          footerLink(context, "Privacy & Policy", "https://example.com/privacy"),
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

  Widget footerLink(BuildContext context, String text, String url) {
    return InkWell(
      onTap: () async {
        if (url.startsWith('/')) {
          Navigator.pushNamed(context, url);
        } else {
          final uri = Uri.parse(url);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            debugPrint('Could not launch $url');
          }
        }
      },
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
      onTap: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          debugPrint('Could not launch $url');
        }
      },
      child: Icon(
        icon,
        color: Colors.white70,
        size: 20,
      ),
    );
  }
}