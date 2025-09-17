import 'package:flutter/material.dart';

class KhanNews extends StatefulWidget {
  const KhanNews({super.key});

  @override
  State<KhanNews> createState() => _KhanNewsState();
}

class _KhanNewsState extends State<KhanNews> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 359,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 359,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isVerySmall = screenWidth <= 400;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isVerySmall ? 16 : (isMobile ? 24 : 60),
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Khan-News",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 22 : 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 12 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                      size: isMobile ? 16 : 22,
                    ),
                  ),
                ],
              )
            ],
          ),

          // Subtitle
          Text(
            "Explore Khan News to stay informed with the latest updates, highlights, and ongoing projects featured in my portfolio",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 13 : 18,
            ),
          ),
          const SizedBox(height: 20),

          // News Cards Section
          SizedBox(
            height: 370,
            child: Row(
              children: [
                if (!isMobile)
                  IconButton(
                    onPressed: _scrollLeft,
                    icon:
                        const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return KhanNewsCard(
                        title: "News Title $index",
                        description:
                            "Description for news card number $index in Khan News section.",
                        imageUrl: "assets/images/profile.png",
                        onPressed: () {},
                        isMobile: isMobile,
                      );
                    },
                  ),
                ),
                if (!isMobile)
                  IconButton(
                    onPressed: _scrollRight,
                    icon:
                        const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KhanNewsCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onPressed;
  final bool isMobile;

  const KhanNewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  State<KhanNewsCard> createState() => _KhanNewsCardState();
}

class _KhanNewsCardState extends State<KhanNewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive card width
    double cardWidth =
        widget.isMobile ? screenWidth * 0.8 : 335; // ~80% width on mobile

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          horizontal: widget.isMobile ? 8 : 12,
          vertical: 8,
        ),
        height: 350,
        width: cardWidth,
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -8, 0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1C1C1C),
              Color(0xFF2A2A2A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.5 : 0.25),
              blurRadius: _isHovered ? 16 : 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Image.asset(
                  widget.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.length > 30
                          ? "${widget.title.substring(0, 27)}..."
                          : widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description.length > 100
                          ? "${widget.description.substring(0, 97)}..."
                          : widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: widget.onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF5722),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Learn More",
                          style: TextStyle(color: Colors.white),
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
