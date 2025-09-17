import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/custom_app_bar.dart';
import 'package:portfolio/desktop/external_widgets/falling_particles.dart';
import 'package:portfolio/desktop/utilities/gradient_pallete.dart';
import 'package:portfolio/desktop/external_widgets/rainbow_cursor_wrapper.dart';

class GradientScaffold extends StatefulWidget
{
  final List<Widget> children;
  final double maxWidth;
  final double maxHeight;
  final String route;

  const GradientScaffold({
    super.key,
    required this.children,
    this.maxWidth = 1500,
    this.maxHeight = 5000,
    required this.route
  });

  @override
  State<GradientScaffold> createState() => _GradientScaffoldState();
}

class _GradientScaffoldState extends State<GradientScaffold>
{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  int _gradientIndex = 0;
  bool themeLock = true;
  Timer? _timer;

  void startGradientTimer()
  {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      setState(() {
        if (!themeLock) {
          _gradientIndex = (_gradientIndex + 1) % 10;
        }
      });
    });
  }

  @override
  void initState()
  {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 300) {
        setState(() => _showBackToTopButton = true);
      } else {
        setState(() => _showBackToTopButton = false);
      }
    });
    startGradientTimer();
  }

  void toggleThemeLock()
  {
    setState(() {
      themeLock = !themeLock;
      if (themeLock) startGradientTimer();
    });
  }

  @override
  void dispose()
  {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    final size = MediaQuery.of(context).size;
    final double width = size.width.clamp(0, widget.maxWidth);
    final double height = size.height.clamp(0, widget.maxHeight);

    if (size.width > 800 && _scaffoldKey.currentState?.isEndDrawerOpen == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scaffoldKey.currentState?.closeEndDrawer();
      });
    }

    return RainbowCursorWrapper(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/coding_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          decoration: BoxDecoration(
            gradient: GradientPalette(index: _gradientIndex, isDark: true).gradient,
          ),
          child: Scaffold(
            key: _scaffoldKey,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            endDrawer: CustomDrawer(route: widget.route, themeLock: themeLock, onToggleLock: toggleThemeLock),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                scrollController: _scrollController,
                themeLock: themeLock,
                onToggleLock: toggleThemeLock,
                route: widget.route,
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 72,
                  color: Colors.black.withValues(alpha: 0.2),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: width,
                      height: height - 72,
                      child: Stack(
                        children: [
                          FallingParticles(numberOfParticles: 200),
                          SingleChildScrollView(
                            controller: _scrollController,
                            child: Container(
                              color: Colors.black.withValues(alpha: 0.2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.children,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: _showBackToTopButton
                ? FloatingActionButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                      size: 30,
                      semanticLabel: 'Back to top',
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
