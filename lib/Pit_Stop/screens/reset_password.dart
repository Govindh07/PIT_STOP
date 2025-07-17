import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    final email = _emailController.text.trim().toLowerCase();
    if (email.isEmpty) return;

    setState(() => _loading = true);

    try {
      // ✅ Check if the email is registered
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      if (methods.isEmpty || !methods.contains('password')) {
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("This email is not registered to any account."),
          ),
        );
      } else {
        // ✅ If registered, send password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Password reset link sent! Check your email."),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = e.message ?? "An error occurred.";
      showDialog(
        context: context,
        builder: (_) => AlertDialog(content: Text(errorMessage)),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _loading
            ? const CircularProgressIndicator(color: Colors.yellow)
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      radius: 30,
                      child: Icon(Icons.vpn_key, color: Colors.black, size: 30),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      textAlign: TextAlign.center,
                      "Enter your email and we will send you a reset password link...",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              passwordReset();
                            }
                          },
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
