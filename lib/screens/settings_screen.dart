import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart'; 
import 'auth_screen.dart'; 

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  bool isDark = themeNotifier.value == ThemeMode.dark;

  void toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = value;
     
      themeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
     
      prefs.setBool('darkMode', isDark);
    });
  }

  void logout() {
 
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings & Profile')),
      body: Column(
        children: [
          const SizedBox(height: 30),
          
          
          Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.withOpacity(0.1),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.pinkAccent,
                      child: Icon(
                        Icons.face_3, 
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Welcome, Beautiful!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('user@easyserve.com', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          const Divider(),

          
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.palette_outlined),
                  title: const Text('Dark Mode'),
                  value: isDark,
                  onChanged: toggleTheme,
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About EasyServe'),
                  onTap: () => showAboutDialog(
                    context: context, 
                    applicationName: 'EasyServe',
                    applicationVersion: '1.0.0',
                    applicationIcon: const Icon(Icons.auto_awesome, color: Colors.orange),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  onTap: logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}