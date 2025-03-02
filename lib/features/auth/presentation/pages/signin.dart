import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_wheather/features/auth/presentation/pages/signup.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_button.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_field.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_text.dart';
import 'package:ai_wheather/features/auth/presentation/cubit/auth_cubit.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 27, 49),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            AuthText(text: 'Email'),
            AuthField(obscureText: false, controller: emailController),
            AuthText(text: 'Password'),
            AuthField(obscureText: true, controller: passwordController),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),

            
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushReplacementNamed(context, "home");
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const CircularProgressIndicator();
                }
                return AuthButton(
                  text: 'Login',
                  onpress: () {
                    context.read<AuthCubit>().login(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                );
              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
