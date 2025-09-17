import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/external_widgets/bouncing_image_profile.dart';
import 'package:portfolio/desktop/external_widgets/link.dart';
import 'package:portfolio/desktop/helper_classes/responsive_layout.dart';

class Body extends StatelessWidget 
{
  const Body({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ResponsiveLayout(

      mobile: const BodyMobile(),

      tablet: const BodyDesktop(),

      desktop: const BodyDesktop(),

    );
  }
}

class BodyDesktop extends StatelessWidget 
{
  const BodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth < 900;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 38 : 60),
      child: Column(
        children: [
          SizedBox(height: isTablet ? 38 : 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 16),
                    child: BouncingProfileImage(
                      height: isTablet ? 300 : 400,
                      width: isTablet ? 180 : 240,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(isTablet ? 10.0 : 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, I'm",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isTablet ? 18 : 22,
                        ),
                      ),
                      Text(
                        'Saad Muhammad Khan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isTablet ? 28 : 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      TypingTextWithCursor(fontSize: isTablet ? 18 : 22),
                      SizedBox(height: isTablet ? 16 : 20),
                      Text(
                        'I build high-performance, cross-platform apps with Flutter, delivering modern, responsive designs and seamless user experiences across mobile, web, and desktop. Skilled in clean UI, smooth performance, and practical, real-world solutions.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: isTablet ? 13 : 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: isTablet ? 23 : 30),
                      Row(
                        children: [
                          ButtonsRow(center: false),
                          if (!isTablet) ...[
                            const Spacer(),
                            LinkVibration(
                              icons: const [
                                FontAwesomeIcons.github,
                                FontAwesomeIcons.linkedinIn,
                                Icons.email,
                              ],
                            ),
                          ]
                        ],
                      ),
                      if (isTablet) ...[
                        SizedBox(height: 40),
                        LinkVibration(
                          icons: const [
                            FontAwesomeIcons.github,
                            FontAwesomeIcons.linkedinIn,
                            Icons.email,
                          ],
                          iconSize: 20,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BodyMobile extends StatelessWidget {
  const BodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isSmall = screenWidth < 370;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BouncingProfileImage(height: 200, width: 150),
          const SizedBox(height: 20),
          Text(
            "Hello, I'm",
            style: TextStyle(
              color: Colors.white70,
              fontSize: isSmall ? 14 : 18,
            ),
          ),
          Text(
            'Saad Muhammad Khan',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmall ? 20 : 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TypingTextWithCursor(fontSize: isSmall ? 14 : 18),
          const SizedBox(height: 15),
          Text(
            'I build high-performance, cross-platform apps with Flutter, delivering modern, responsive designs and seamless user experiences across mobile, web, and desktop.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: isSmall ? 12 : 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          ButtonsRow(center: true, isSmall: isSmall),
          const SizedBox(height: 40),
          LinkVibration(
            icons: const [
              FontAwesomeIcons.github,
              FontAwesomeIcons.linkedinIn,
              Icons.email,
            ],
            spacing: 60,
            iconSize: isSmall ? 18 : 22,
          ),
        ],
      ),
    );
  }
}

class TypingTextWithCursor extends StatefulWidget {
  final double fontSize;
  const TypingTextWithCursor({super.key, required this.fontSize});

  @override
  State<TypingTextWithCursor> createState() => _TypingTextWithCursorState();
}

class _TypingTextWithCursorState extends State<TypingTextWithCursor> {
  final List<String> texts = [
    "Flutter Developer",
    "Mobile App Developer",
    "Cross-Platform Developer",
    "Computer Scientist",
    "Nustian",
    "Pakistani"
  ];

  int index = 0;
  String displayText = '';
  bool isDeleting = false;
  late Timer _timer;
  int charIndex = 0;
  bool showCursor = true;
  int pauseCounter = 0;
  final Color cursorColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _startTyping();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() => showCursor = !showCursor);
    });
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (!isDeleting) {
          if (charIndex < texts[index].length) {
            displayText += texts[index][charIndex];
            charIndex++;
          } else {
            pauseCounter++;
            if (pauseCounter > 8) {
              isDeleting = true;
              pauseCounter = 0;
            }
          }
        } else {
          if (charIndex > 0) {
            displayText = displayText.substring(0, charIndex - 1);
            charIndex--;
          } else {
            isDeleting = false;
            index = (index + 1) % texts.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fontSize + 10,
      child: RichText(
        text: TextSpan(
          text: "And I'm a ",
          style: TextStyle(color: Colors.white70, fontSize: widget.fontSize),
          children: [
            TextSpan(
              text: displayText,
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: "font1",
              ),
            ),
            TextSpan(
              text: showCursor ? "|" : "",
              style: TextStyle(
                color: cursorColor,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  final bool center;
  final bool isSmall;
  const ButtonsRow({super.key, required this.center, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isSmall ? 18 : 24,
              vertical: isSmall ? 10 : 14,
            ),
          ),
          onPressed: () {Navigator.pushNamed(context, "/myprojects");},
          child: Text(
            'My Projects',
            style: TextStyle(fontSize: isSmall ? 14 : 16, color: Colors.white),
          ),
        ),
        SizedBox(width: isSmall ? 10 : 15),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isSmall ? 18 : 24,
              vertical: isSmall ? 10 : 14,
            ),
          ),
          onPressed: () {Navigator.pushNamed(context, "/contact");},
          child: Text(
            'Contact Me',
            style: TextStyle(fontSize: isSmall ? 14 : 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}


class LinkVibration extends StatefulWidget {
  final List<IconData> icons;
  final double iconSize;
  final double spacing;

  const LinkVibration({
    super.key,
    required this.icons,
    this.iconSize = 25,
    this.spacing = 60,
  });

  @override
  State<LinkVibration> createState() => _LinkVibrationState();
}

class _LinkVibrationState extends State<LinkVibration>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.icons.length * widget.spacing,
      height: widget.iconSize + 40,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value * 2 * math.pi;
          return Stack(
            children: List.generate(widget.icons.length, (i) {
              final dx = i * widget.spacing;
              final dy = math.sin(t + i) * 15;
              return Transform.translate(
                offset: Offset(dx, dy),
                child: Link(
                  icon: widget.icons[i],
                  size: widget.iconSize,
                  outlineColor: Colors.white,
                  onPressed: () {},
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
