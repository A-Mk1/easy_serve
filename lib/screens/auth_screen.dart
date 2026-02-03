import 'package:flutter/material.dart';
import 'main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _loginKey = GlobalKey<FormState>();
  final _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color.fromARGB(255, 189, 100, 6), Color.fromARGB(255, 198, 121, 14)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
             
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.auto_awesome, color: Colors.white, size: 50),
                    ),
                    const SizedBox(height: 15),
                    const Text("EasyServe", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                    const Text("Your Beauty Journey Starts Here ✨", style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
              
                      TabBar(
                        labelColor: Colors.orange.shade800,
                        unselectedLabelColor: const Color.fromARGB(255, 86, 59, 59),
                        indicatorColor: Colors.orange.shade800,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(text: "Login"),
                          Tab(text: "Sign Up"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildLoginForm(),
                            _buildSignUpForm(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
   
  Widget _buildLoginForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _loginKey,
        child: Column(
          children: [
            _customTextField(Icons.email_outlined, "Email"),
            const SizedBox(height: 20),
            _customTextField(Icons.lock_outline, "Password", obscure: true),
            const SizedBox(height: 40),
            _authButton("Login"),
          ],
        ),
      ),
    );
  }

 
  Widget _buildSignUpForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _signUpKey,
        child: Column(
          children: [
            _customTextField(Icons.person_outline, "Full Name"),
            const SizedBox(height: 20),
            _customTextField(Icons.email_outlined, "Email"),
            const SizedBox(height: 20),
            _customTextField(Icons.lock_outline, "Password", obscure: true),
            const SizedBox(height: 40),
            _authButton("Register Now"),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(IconData icon, String label, {bool obscure = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.orange),
          labelText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
        validator: (v) => v!.isEmpty ? "Required field" : null,
      ),
    );
  }


  Widget _authButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade800,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen()));
        },
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}