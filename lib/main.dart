import 'package:bidder_game/screens/home_page.dart';
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
            appBarTheme: NeumorphicAppBarThemeData(
              iconTheme: IconThemeData(color: Colors.white),
              buttonStyle: NeumorphicStyle(
                depth: 1,
                intensity: 0.9,
                lightSource: LightSource.top,
              ),
            ),
            baseColor: Colors.grey[800],
            lightSource: LightSource.topLeft,
            depth: -3,
            intensity: 0.8,
            defaultTextColor: Colors.yellowAccent),
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          HistoryScreen.id: (context) => HistoryScreen(),
        },
      ),
    );
  }
}
