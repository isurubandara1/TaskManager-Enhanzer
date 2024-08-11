import 'package:flutter/material.dart';
import 'views/task_list_screen.dart';
import 'views/settings_screen.dart';
import 'package:provider/provider.dart';
import 'view_models/task_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        title: 'Task Manager App',
        theme: _isDarkMode ? _darkTheme : _lightTheme,
        home: TaskListScreen(
          onThemeChanged: (isDarkMode) {
            setState(() {
              _isDarkMode = isDarkMode;
            });
          },
        ),
        routes: {
          '/settings': (context) => SettingsScreen(
                isDarkMode: _isDarkMode,
                onThemeChanged: (isDarkMode) {
                  setState(() {
                    _isDarkMode = isDarkMode;
                  });
                },
              ),
        },
      ),
    );
  }

  ThemeData get _lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.amber,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.black), // Ensure icons are white
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: Colors.amber,
        onPrimary: Colors.white,
        background: Colors.white,
      ),
      // Other theme properties...
    );
  }

  ThemeData get _darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.brown,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.white), // Ensure icons are white
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.amber,
      ),
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(
        primary: Colors.brown,
        onPrimary: Colors.white,
        background: Colors.black,
      ),
      // Other theme properties...
    );
  }
}
