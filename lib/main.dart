

import 'package:ai_wheather/features/auth/data/auth/repository/repository_impl.dart';
import 'package:ai_wheather/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ai_wheather/features/auth/presentation/pages/signin.dart';
import 'package:ai_wheather/features/auth/presentation/pages/signup.dart';

import 'package:ai_wheather/features/weather/presentation/controller/cubit/ai_cubit.dart';
import 'package:ai_wheather/features/weather/presentation/controller/cubit/forecast_cubit.dart';
import 'package:ai_wheather/features/weather/presentation/screens/home.dart';
import 'package:ai_wheather/injection_container.dart';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();
  runApp(const MyApp());
}
//a
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(authRepositoryImpl())),
            BlocProvider(create: (_) => sl<ForecastCubit>()),
        BlocProvider(create: (_) => sl<AICubit>(),),
     
  
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'signup',
        routes: {
          'signup': (context) => const Signup(),
          'signin': (context) => const Signin(),
          'home': (context) => ForecastPage(),
        },
      ),
    );
  }
}


