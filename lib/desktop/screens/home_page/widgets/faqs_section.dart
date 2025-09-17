import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

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
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header + Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Find answers to common questions about me.",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                      size: 22,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ],
              ),

            ],
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(child: _FAQCard(faqs[0]["q"]!, faqs[0]["a"]!)),
              Expanded(child: _FAQCard(faqs[1]["q"]!, faqs[1]["a"]!)),
              Expanded(child: _FAQCard(faqs[2]["q"]!, faqs[2]["a"]!)),
            ],
          ),

          Row(
            children: [
              Expanded(child: _FAQCard(faqs[3]["q"]!, faqs[3]["a"]!)),
              Expanded(child: _FAQCard(faqs[4]["q"]!, faqs[4]["a"]!)),
            ],
          ),

          Row(
            children: [
              Expanded(child: _FAQCard(faqs[5]["q"]!, faqs[5]["a"]!)),
              Expanded(child: _FAQCard(faqs[6]["q"]!, faqs[6]["a"]!)),
              Expanded(child: _FAQCard(faqs[7]["q"]!, faqs[7]["a"]!)),
            ],
          ),
        ],
      ),
    );
  }
}

class _FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQCard(this.question, this.answer);

  @override
  State<_FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<_FAQCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        transform: _hovered ? Matrix4.translationValues(0, -8, 0) : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.question, textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                widget.answer,
                style: const TextStyle(fontSize: 13, color: Colors.white70),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
