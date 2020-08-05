import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'data/moor_database.dart';
import 'screens/history_screen.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (context, value) => value.close(),
      child: NeumorphicApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFFFFFFF),
          lightSource: LightSource.topLeft,
          depth: -15,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Colors.grey[400],
          lightSource: LightSource.topLeft,
          depth: -3,
          intensity: 0.8,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          HistoryScreen.id: (context) => HistoryScreen(),
        },
      ),
    );
  }
}
