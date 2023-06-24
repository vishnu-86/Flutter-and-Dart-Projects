import 'package:flutter/material.dart';
import 'widgets/expence_tracker.dart';

class ThemeChange extends StatefulWidget {
  const ThemeChange({super.key});
  @override
  State<ThemeChange> createState() {
    return _ThemeChange();
  }
}

class _ThemeChange extends State<ThemeChange> {
  var kcolor = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 77, 87, 192),
  );
  var kcolordark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 73, 52, 143),
  );
  bool t=false;

  void changetheme(bool i){
    setState(() {
      t=i;
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kcolordark,
        cardTheme: const CardTheme().copyWith(
            color:const  Color.fromARGB(255, 88, 66, 143),
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor:const  Color.fromARGB(255, 88, 66, 143),),
          ),
      ),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolor,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kcolor.onPrimaryContainer,
            foregroundColor: kcolor.onPrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            color: const Color.fromARGB(255, 224, 214, 249),
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 230, 226, 245),),
          ),
        ),
        themeMode: t==false?ThemeMode.light:ThemeMode.dark,
        home: ExpenseTracker(changetheme)
        );
  }
}