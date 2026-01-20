import 'package:flutter/material.dart';

/// A tiny global controller to toggle light/dark across the whole app.
/// (No external state management package needed.)
class AppThemeController {
  static final AppThemeController instance = AppThemeController._internal();
  AppThemeController._internal();

  /// true => dark mode, false => light mode
  final ValueNotifier<bool> isDark = ValueNotifier<bool>(true);

  ThemeMode get themeMode => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void toggle() => isDark.value = !isDark.value;
}


