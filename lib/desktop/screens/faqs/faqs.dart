import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/footer.dart';
import 'package:portfolio/desktop/external_widgets/gradient_scaffold.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        "q": "What services do you provide?",
        "a": "I specialize in Flutter development, building cross-platform mobile and web applications with modern UI and clean architecture."
      },
      {
        "q": "Why do you prefer Flutter?",
        "a": "Flutter is easy, efficient, and comfortable compared to other frameworks. It is growing steadily and has the potential to surpass many technologies in the future."
      },
      {
        "q": "Do you build apps for both Android and iOS?",
        "a": "Currently, I focus on Android apps, but since Flutter uses a single codebase, publishing to iOS is not an issue."
      },
      {
        "q": "Can you also build web applications?",
        "a": "Yes, I build Flutter web applications, including this portfolio itself."
      },
      {
        "q": "What types of projects have you worked on?",
        "a": "I have developed games in C++, medical apps, and management systems using different tools and technologies."
      },
      {
        "q": "Do you also work on UI/UX design?",
        "a": "Yes, I occasionally design user interfaces, ensuring they are intuitive and user-friendly."
      },
      {
        "q": "Do you work with Firebase?",
        "a": "Yes, I am comfortable with Firebase and use it frequently in my projects."
      },
      {
        "q": "Do you also use other backends?",
        "a": "Yes, besides Firebase, I also use Flask and structured databases when required."
      },
      {
        "q": "How do you ensure code efficiency?",
        "a": "I remove unused code, avoid repetition, and optimize loading by only fetching necessary resources."
      },
      {
        "q": "Have you published apps to Play Store or App Store?",
        "a": "Not yet, but I plan to publish apps in the future."
      },
      {
        "q": "How do you test your apps?",
        "a": "I test apps on real devices, ensuring all features work smoothly. I also let others test my apps to gather feedback for improvements."
      },
      {
        "q": "Do you build portfolio websites?",
        "a": "Yes, in fact, this portfolio is fully built with Flutter."
      },
      {
        "q": "Do you work on backend development?",
        "a": "Yes, but I am more inclined towards frontend development."
      },
      {
        "q": "What is your development process?",
        "a": "I begin with frontend design based on client needs and then proceed with backend, integration, and optimizations."
      },
      {
        "q": "Do you contribute to open-source projects?",
        "a": "I am planning to contribute in the near future as I expand my projects."
      },
      {
        "q": "Are you open to freelance work?",
        "a": "Yes, I am available for freelance projects and collaborations."
      },
      {
        "q": "Can you integrate APIs and databases?",
        "a": "Yes, I can integrate REST APIs, Firebase, and SQL databases depending on the project requirements."
      },
      {
        "q": "Do you offer support after project completion?",
        "a": "Yes, I provide support and improvements if required after delivering the project."
      },
      {
        "q": "Can I hire you for long-term projects?",
        "a": "Yes, I am available for both short-term and long-term collaborations."
      },
      {
        "q": "How can I contact you?",
        "a": "You can reach out to me via the Contact page on my portfolio."
      },
    ];

    return GradientScaffold(
      route: "/faqs",
      children: [
        const SizedBox(height: 60),
        const Center(
          child: Text(
            "Frequently Asked Questions",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "Here are some common questions people ask me as a Flutter & Cross-Platform Developer.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),

        // FAQ Section
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 120),
          child: Column(
            children: faqs
                .map((faq) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2A2A2A), Color(0xFF1E1E1E)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          ),
                          child: ExpansionTile(
                            collapsedIconColor: Colors.deepOrange,
                            iconColor: Colors.deepOrange,
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            title: Text(
                              faq["q"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  faq["a"]!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    height: 1.6,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),

        const SizedBox(height: 70),
        CustomFooter(),
      ],
    );
  }
}
