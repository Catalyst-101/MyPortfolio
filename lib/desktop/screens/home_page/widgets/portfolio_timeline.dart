import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class PortfolioTimeline extends StatelessWidget
{
  const PortfolioTimeline({super.key});

  final List<Map<String, String>> phases = const [
    {
      "year": "2022",
      "title": "Matric Completion",
      "desc": "Completed my matriculation from APS Risalpur."
    },
    {
      "year": "2024",
      "title": "FSc Completion",
      "desc": "Completed Pre-Engineering from Govt College Peshawar, being a top student in the college."
    },
    {
      "year": "2024",
      "title": "Started BS Computer Science",
      "desc": "Joined NUST Islamabad for BS Computer Science, learning coding languages, algorithms, and other technical skills."
    },
    {
      "year": "2025",
      "title": "Currently in 2nd Semester",
      "desc": "Pursuing BS Computer Science at NUST with a CGPA of 3.82/4.00."
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
      child: Column(
        children: [

          const Text(
            'My Evolution',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          Container(
            width: 4,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(phases.length, (index) {
                  final phase = phases[index];
                  final isLeft = index % 2 == 0;
                  return TimelineItem(
                    year: phase['year']!,
                    title: phase['title']!,
                    desc: phase['desc']!,
                    isLeft: isLeft,
                    isLast: index == phases.length - 1,
                    screenWidth: constraints.maxWidth,
                  );
                }),
              );
            },
          ),

          Container(
            width: 4,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget
{
  final String year;
  final String title;
  final String desc;
  final bool isLeft;
  final bool isLast;
  final double screenWidth;

  const TimelineItem({
    super.key,
    required this.year,
    required this.title,
    required this.desc,
    required this.isLeft,
    required this.isLast,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context)
  {
    if (screenWidth < 800) {
      return Column(
        children: [
          const SizedBox(height: 20),
          _buildTimelineNode(),
          const SizedBox(height: 20),
          PhaseCard(year: year, title: title, desc: desc),
          if (!isLast) const SizedBox(height: 40),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: isLeft
                ? PhaseCard(year: year, title: title, desc: desc)
                : const SizedBox.shrink(),
          ),
        ),

        SizedBox(
          width: 160,
          child: isLeft
              ? DottedLine(
                  direction: Axis.horizontal,
                  dashLength: 8,
                  dashGapLength: 4,
                  lineThickness: 2,
                  dashColor: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        SizedBox(
          child: Center(child: _buildTimelineNode()),
        ),

        SizedBox(
          width: 160,
          child: !isLeft
              ? DottedLine(
                  direction: Axis.horizontal,
                  dashLength: 8,
                  dashGapLength: 4,
                  lineThickness: 2,
                  dashColor: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: !isLeft
                ? PhaseCard(year: year, title: title, desc: desc)
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineNode()
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 4,
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.deepOrange, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.5),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhaseCard extends StatelessWidget
{
  final String year;
  final String title;
  final String desc;

  const PhaseCard({
    super.key,
    required this.year,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context)
  {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320, maxHeight: 250),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withValues(alpha: 0.05),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              year,
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
