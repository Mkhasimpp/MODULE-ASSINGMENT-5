import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          // 🌙 Dark Mode
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: theme.isDark,
            onChanged: (_) => theme.toggleTheme(),
          ),

          const Divider(),

          // 🔠 Font Size Title
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Font Size",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Small Font
          RadioListTile<int>(
            title: const Text("Small"),
            value: 12,
            groupValue: theme.baseFontSize.toInt(),
            onChanged: (_) => theme.setSmall(),
          ),

          // Medium Font
          RadioListTile<int>(
            title: const Text("Medium"),
            value: 14,
            groupValue: theme.baseFontSize.toInt(),
            onChanged: (_) => theme.setMedium(),
          ),

          // Large Font
          RadioListTile<int>(
            title: const Text("Large"),
            value: 18,
            groupValue: theme.baseFontSize.toInt(),
            onChanged: (_) => theme.setLarge(),
          ),

          const Divider(),

          // 🔤 Font Family
          SwitchListTile(
            title: const Text("Use Roboto Font"),
            subtitle: Text(
              theme.useRoboto ? "Roboto" : "Poppins",
            ),
            value: theme.useRoboto,
            onChanged: (_) => theme.toggleFont(),
          ),
        ],
      ),
    );
  }
}
