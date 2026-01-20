import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/desktop/external_widgets/custom_app_bar.dart';
import 'package:portfolio/desktop/external_widgets/falling_particles.dart';
import 'package:portfolio/desktop/utilities/gradient_pallete.dart';
import 'package:portfolio/desktop/external_widgets/rainbow_cursor_wrapper.dart';
import 'package:portfolio/app_theme_controller.dart';

// Global state manager for gradient that persists across all pages
class _GradientStateManager {
  static final _GradientStateManager _instance = _GradientStateManager._internal();
  factory _GradientStateManager() => _instance;
  _GradientStateManager._internal();

  int _gradientIndex = 0;
  bool _themeLock = true;
  Timer? _timer;
  final List<ValueNotifier<int>> _listeners = [];

  int get gradientIndex => _gradientIndex;
  bool get themeLock => _themeLock;

  void addListener(ValueNotifier<int> notifier) {
    _listeners.add(notifier);
    notifier.value = _gradientIndex; // Set initial value
  }

  void removeListener(ValueNotifier<int> notifier) {
    _listeners.remove(notifier);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.value = _gradientIndex;
    }
  }

  bool get isTimerRunning => _timer != null;

  void startGradientTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!_themeLock) {
        _gradientIndex = (_gradientIndex + 1) % 10;
        _notifyListeners();
      }
    });
  }

  void toggleThemeLock() {
    _themeLock = !_themeLock;
    if (!_themeLock) {
      startGradientTimer();
    }
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}

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
  final _GradientStateManager _stateManager = _GradientStateManager();
  late ValueNotifier<int> _gradientIndexNotifier;

  @override
  void initState()
  {
    super.initState();
    _gradientIndexNotifier = ValueNotifier<int>(_stateManager.gradientIndex);
    _stateManager.addListener(_gradientIndexNotifier);
    
    // Start the timer if it's not already running
    if (!_stateManager.isTimerRunning) {
      _stateManager.startGradientTimer();
    }
    
    _scrollController.addListener(() {
      if (_scrollController.offset >= 300) {
        setState(() => _showBackToTopButton = true);
      } else {
        setState(() => _showBackToTopButton = false);
      }
    });
  }

  void toggleThemeLock()
  {
    setState(() {
      _stateManager.toggleThemeLock();
    });
  }

  @override
  void dispose()
  {
    _stateManager.removeListener(_gradientIndexNotifier);
    _gradientIndexNotifier.dispose();
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
        child: ListenableBuilder(
          listenable: Listenable.merge([
            _gradientIndexNotifier,
            AppThemeController.instance.isDark,
          ]),
          builder: (context, child) {
            final gradientIndex = _gradientIndexNotifier.value;
            final isDark = AppThemeController.instance.isDark.value;
            return AnimatedContainer(
              duration: const Duration(seconds: 3),
              decoration: BoxDecoration(
                gradient: GradientPalette(index: gradientIndex, isDark: isDark).gradient,
              ),
              child: Scaffold(
                key: _scaffoldKey,
                extendBodyBehindAppBar: true,
                backgroundColor: Colors.transparent,
                endDrawer: CustomDrawer(
                  route: widget.route,
                  themeLock: _stateManager.themeLock,
                  onToggleLock: toggleThemeLock,
                ),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: CustomAppBar(
                    scrollController: _scrollController,
                    themeLock: _stateManager.themeLock,
                    onToggleLock: toggleThemeLock,
                    route: widget.route,
                  ),
                ),
            body: Column(
              children: [
                Container(
                  height: 72,
                  color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.2),
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
                              color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.2),
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
            );
          },
        ),
      ),
    );
  }
}
