import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var p = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SwitchListTile(
              value: p.dark,
              onChanged: (_) => p.toggleDark(),
              title: const Text("Dark Mode"),
            ),

            const SizedBox(height: 10),

            const Text("Font Family"),

            DropdownButton(
              value: p.font,
              items: ['Roboto','Poppins','OpenSans']

                .map((e) =>
                  DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => p.changeFont(v.toString()),
            ),

            const SizedBox(height: 20),

            const Text("Font Size"),

            RadioListTile(
              value: 12.0,
              groupValue: p.fontSize,
              onChanged: (v) => p.changeFontSize(v!),
              title: const Text("Small"),
            ),

            RadioListTile(
              value: 16.0,
              groupValue: p.fontSize,
              onChanged: (v) => p.changeFontSize(v!),
              title: const Text("Medium"),
            ),

            RadioListTile(
              value: 20.0,
              groupValue: p.fontSize,
              onChanged: (v) => p.changeFontSize(v!),
              title: const Text("Large"),
            ),
          ],
        ),
      ),
    );
  }
}
