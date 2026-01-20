import 'package:flutter/material.dart';
import 'package:portfolio/app_theme_controller.dart';

class CustomAppBar extends StatefulWidget 
{
  final ScrollController scrollController;
  final bool themeLock;
  final VoidCallback onToggleLock;
  final String route;

  const CustomAppBar({super.key, required this.scrollController, required this.themeLock, required this.onToggleLock, required this.route});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool hasScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final isScrolled = widget.scrollController.offset > 20;
    if (isScrolled != hasScrolled) {
      setState(() => hasScrolled = isScrolled);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final onSurface = scheme.onSurface;
    final surface = scheme.surface;
    final borderColor = scheme.outlineVariant;

    return SizedBox(
      height: 72,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: hasScrolled
                  ? surface.withValues(alpha: 0.65)
                  : Colors.transparent,
              border: hasScrolled
                  ? Border(
                      bottom: BorderSide(color: borderColor, width: 1),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  "KHAN BHAI",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: onSurface,
                  ),
                ),

                Spacer(),

                if (MediaQuery.of(context).size.width > 1000) ...[

                _NavBar(route: widget.route),

                const Spacer(),

                ThemeLocker(
                  initialLocked: widget.themeLock,
                  toggle2: widget.onToggleLock,
                ),

                _ThemeToggleButton(),

              ]
              else...[

                Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: onSurface, size: 28),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),

              ]

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _NavBar extends StatefulWidget
{
  final String route;
  
  const _NavBar({required this.route});

  @override
  State<_NavBar> createState()
  {
    return _NavBarState();
  }
}

class _NavBarState extends State<_NavBar>
{
  int hoveredIndex = -1;
  final navItems = ["Home", "Khan News","My Projects","About Me", "FAQS", "Contact"];
  final nav = ["/", "/khannews", "/myprojects", "/aboutme", "/faqs", "/contact"];

  @override
  Widget build(BuildContext context)
  {
    final scheme = Theme.of(context).colorScheme;
    final baseColor = scheme.onSurface.withValues(alpha: 0.75);
    final hoverColor = scheme.onSurface;

    return Row(
      children: List.generate(navItems.length, (i)
      {
        final isHovered = hoveredIndex == i;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => hoveredIndex = i),
          onExit: (_) => setState(() => hoveredIndex = -1),
          child: GestureDetector(
            onTap: () => widget.route != nav[i] ? Navigator.pushNamed(context, nav[i]) : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: TextStyle(
                      color: isHovered ? hoverColor : baseColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "font1",
                    ),
                    child: Text(navItems[i]),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: (isHovered || widget.route == nav[i]) ? 20 : 0,
                    color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ThemeLocker extends StatefulWidget {
  final bool initialLocked;
  final VoidCallback toggle2;

  const ThemeLocker({
    super.key,
    this.initialLocked = false,
    required this.toggle2,
  });

  @override
  State<ThemeLocker> createState() => _ThemeLockerState();
}

class _ThemeLockerState extends State<ThemeLocker> {
  late bool _locked;

  @override
  void initState() {
    super.initState();
    _locked = widget.initialLocked;
  }

  void _toggle() {
    setState(() => _locked = !_locked);
    widget.toggle2();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Colors.black.withValues(alpha: 0.3);
    final knobAlignment = _locked ? Alignment.centerRight : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: _toggle,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 72,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: knobAlignment,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    transitionBuilder: (child, anim) {
                      return ScaleTransition(scale: anim, child: child);
                    },
                    child: _locked
                        ? const Icon(Icons.lock, key: ValueKey('locked'), size: 16, color: Colors.black)
                        : const Icon(Icons.lock_open, key: ValueKey('unlocked'), size: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeToggleButton extends StatefulWidget
{
  @override
  State<_ThemeToggleButton> createState()
  {
    return _ThemeToggleButtonState();
  }
}

class _ThemeToggleButtonState extends State<_ThemeToggleButton>
    with SingleTickerProviderStateMixin
{
  @override
  Widget build(BuildContext context)
  {
    final controller = AppThemeController.instance;

    return ValueListenableBuilder<bool>(
      valueListenable: controller.isDark,
      builder: (context, isDark, _) {
        final iconColor = Theme.of(context).colorScheme.onSurface;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation)
          {
            return RotationTransition(
              turns: Tween(begin: 0.75, end: 1.0).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: IconButton(
            key: ValueKey<bool>(isDark),
            icon: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny,
              color: iconColor,
            ),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: controller.toggle,
          ),
        );
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final String route;
  final bool themeLock;
  final VoidCallback onToggleLock;

  const CustomDrawer({
    super.key,
    required this.route,
    required this.themeLock,
    required this.onToggleLock,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: scheme.surface.withValues(alpha: 0.92), // transparent effect
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with theme controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ThemeLocker(
                    initialLocked: themeLock,
                    toggle2: onToggleLock,
                  ),
                  _ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 30),

              // Navigation options
              Expanded(
                child: ListView(
                  children: [
                    _drawerItem(context, "Home", "/", route),
                    _drawerItem(context, "Khan News", "/khannews", route),
                    _drawerItem(context, "My Projects", "/myprojects", route),
                    _drawerItem(context, "About Me", "/aboutme", route),
                    _drawerItem(context, "FAQS", "/faqs", route),
                    _drawerItem(context, "Contact", "/contact", route),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String nav, String currentRoute) {
    final scheme = Theme.of(context).colorScheme;
    final isActive = currentRoute == nav;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.deepOrange : scheme.onSurface,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        if (currentRoute != nav) {
          Navigator.pushNamed(context, nav);
        }
        Navigator.pop(context); // close drawer
      },
    );
  }
}
