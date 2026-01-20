import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Link extends StatefulWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final Color? outlineColor;
  final String url;

  const Link({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.outlineColor,
    required this.url
  });

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  bool hovered = false;

  Future<void> _openLink(String url) async {
    final Uri? uri = Uri.tryParse(url);
    if (uri == null) return;

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 350),
        scale: hovered ? 1.3 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: hovered
                ? const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.blue,
                      Colors.indigo,
                      Colors.purple
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            border: hovered
                ? null
                : Border.all(color: widget.outlineColor ?? Colors.white),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: IconButton(
            onPressed: () {
              if (widget.url.trim().isNotEmpty) {
                _openLink(widget.url);
              }
            },
            icon: Icon(
              widget.icon,
              size: widget.size ?? 24,
              color: widget.color ?? Colors.white,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}