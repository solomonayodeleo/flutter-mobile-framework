import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  ThemePreferences._();

  static const _key = 'app_theme_mode';

  static Future<ThemeMode> load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);
    return switch (value) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }

  static Future<void> save(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }
}
