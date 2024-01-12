import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/constants/routes.dart';
import 'package:first/utilities/show_error_dialog.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          'Register',
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
                child: const Text('Register'),
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);
                    final user = FirebaseAuth.instance.currentUser;
                    user?.sendEmailVerification();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamed(verifyEmailRoute);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'channel-error') {
                      // ignore: use_build_context_synchronously
                      showErrorDialog(context, 'Please fill in all fields');
                    } else if (e.code == 'email-already-in-use') {
                      // ignore: use_build_context_synchronously
                      showErrorDialog(context, 'Email is already in use');
                    } else if (e.code == 'invalid-email') {
                      // ignore: use_build_context_synchronously
                      showErrorDialog(context, 'Invalid email entered');
                    } else if (e.code == 'weak-password') {
                      // ignore: use_build_context_synchronously
                      showErrorDialog(context, 'Weak password entered');
                    } else {
                      // ignore: use_build_context_synchronously
                      await showErrorDialog(
                        context,
                        'Error: ${e.code}',
                      );
                    }
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    await showErrorDialog(context, e.toString());
                  }
                }),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text('Already registered? Login Now!'),
          ),
        ],
      ),
    );
  }
}
