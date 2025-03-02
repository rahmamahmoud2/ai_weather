
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_wheather/features/auth/presentation/pages/signin.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_button.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_field.dart';
import 'package:ai_wheather/features/auth/presentation/widgets/auth_text.dart';
import 'package:ai_wheather/features/auth/presentation/cubit/auth_cubit.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 27, 49),
      body:
      SingleChildScrollView(
        child:     Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            AuthText(text: 'Full Name'),
            AuthField(obscureText: false, controller: nameController),
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
                  text: 'Sign up',
                  onpress: () {
                    context.read<AuthCubit>().signUp(
                      nameController.text,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin()));
              },
              child: RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      )
   
     );
  }
}
