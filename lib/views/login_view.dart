// LGGIN PAGE
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/constants/routes.dart';
import 'package:first/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration:
                const InputDecoration(hintText: 'Enter your email here...'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: 'Enter your password here...'),
          ),
          Center(
            child: TextButton(
                child: const Text('Login'),
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    devtools.log(userCredential.toString());
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      notesRoute,
                      (route) => false,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-credential') {
                      // ignore: use_build_context_synchronously
                      await showErrorDialog(
                        context,
                        'Wrong email or password entered. Register if you have no account or check your credentials.',
                      );
                    } else if (e.code == 'channel-error') {
                      // ignore: use_build_context_synchronously
                      await showErrorDialog(
                        context,
                        'Please fill in all the fields',
                      );
                    } else if (e.code == 'invalid-email') {
                      // ignore: use_build_context_synchronously
                      await showErrorDialog(
                        context,
                        'Invalid email',
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      await showErrorDialog(
                        context,
                        'Error: ${e.code}',
                      );
                    }
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    await showErrorDialog(
                        context,
                        e.toString()
                      );
                  }
                }),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text('Not registered yet? Register Here!'),
          ),
        ],
      ),
    );
  }
}

