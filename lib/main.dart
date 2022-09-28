import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/home/home_page.dart';
import 'package:my_portfolio/services/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeService>(
      create: (_) => ThemeService(),
      child: Builder(builder: (BuildContext context) {
        final themeService = Provider.of<ThemeService>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Demo",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness:
                  themeService.darkTheme ? Brightness.dark : Brightness.light,
              seedColor: Colors.indigo,
            ),
          ),
          home: HomePage(),
        );
      }),
    );
  }
}
