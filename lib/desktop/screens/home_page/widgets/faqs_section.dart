import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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

    double titleSize = screenWidth < 600 ? 20 : (screenWidth < 900 ? 22 : 24);
    double subtitleSize = screenWidth < 600 ? 12 : 14;
    double cardQuestionSize = screenWidth < 600 ? 14 : 16;
    double cardAnswerSize = screenWidth < 600 ? 12 : 13;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: screenWidth < 600 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (screenWidth > 800)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Frequently Asked Questions",
                      style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Find answers to common questions about me.",
                      style: TextStyle(fontSize: subtitleSize, color: Colors.white70),
                    ),
                  ],
                ),
                if (screenWidth <= 900)
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
                  )
                else
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
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Frequently Asked Questions",
                  style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  "Find answers to common questions about me.",
                  style: TextStyle(fontSize: subtitleSize, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

          const SizedBox(height: 30),

          if (screenWidth > 900) ...[
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[0]["q"]!, faqs[0]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[1]["q"]!, faqs[1]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[2]["q"]!, faqs[2]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[3]["q"]!, faqs[3]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[4]["q"]!, faqs[4]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[5]["q"]!, faqs[5]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[6]["q"]!, faqs[6]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[7]["q"]!, faqs[7]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
          ] else if (screenWidth >= 700) ...[
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[0]["q"]!, faqs[0]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[1]["q"]!, faqs[1]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[2]["q"]!, faqs[2]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[3]["q"]!, faqs[3]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _FAQCard(faqs[5]["q"]!, faqs[5]["a"]!, cardQuestionSize, cardAnswerSize)),
                Expanded(child: _FAQCard(faqs[6]["q"]!, faqs[6]["a"]!, cardQuestionSize, cardAnswerSize)),
              ],
            ),
          ] else ...[
            for (int i = 0; i < 4; i++)
              _FAQCard(faqs[i]["q"]!, faqs[i]["a"]!, cardQuestionSize, cardAnswerSize),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
          ]
        ],
      ),
    );
  }
}

class _FAQCard extends StatefulWidget {
  final String question;
  final String answer;
  final double qSize;
  final double aSize;

  const _FAQCard(this.question, this.answer, this.qSize, this.aSize);

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
            Text(
              widget.question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: widget.qSize, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              widget.answer,
              style: TextStyle(fontSize: widget.aSize, color: Colors.white70),
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
