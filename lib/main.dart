import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';


 
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('darkMode') ?? false;
  themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;

  runApp(const EasyServeApp());
}

class EasyServeApp extends StatelessWidget {
  const EasyServeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EasyServe',
          
          
          theme: ThemeData(
            primarySwatch: Colors.orange,
            primaryColor: const Color(0xFFD47A1F),
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
          ),

  
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.orange,
          ),

          themeMode: currentMode,
          
          home: const SplashScreen(), 
        );
      },
    );
  }
}