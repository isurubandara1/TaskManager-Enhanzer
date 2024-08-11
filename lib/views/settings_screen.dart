import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  SettingsScreen({required this.isDarkMode, required this.onThemeChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                widget.onThemeChanged(_isDarkMode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
