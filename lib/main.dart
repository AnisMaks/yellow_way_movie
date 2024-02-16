import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../main_page.dart';
import '../models/liked_model.dart';
import '../utils.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<LikedModel>(LikedModelAdapter());
  await Hive.openBox<LikedModel>('liked');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(const MyApp());
    });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yellow Way',
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'poppins',
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 52, 52, 52)),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Color.fromARGB(255, 247, 246, 242),
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255))),
          scaffoldBackgroundColor: kBackgoundColor,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder()
          })),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
