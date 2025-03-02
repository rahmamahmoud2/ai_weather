
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_wheather/features/weather/domain/entity/repo_entity.dart';
import 'package:ai_wheather/features/weather/presentation/controller/cubit/ai_cubit.dart';

class AIPredictionButton extends StatelessWidget {
  final ResponseEntity weatherData;

  const AIPredictionButton({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AICubit, AIState>(
      listener: (context, state) {
        if (state is AISuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
            
                title: Text("Tennis Prediction"),
                content: Text(state.prediction == 1
                    ? "You can play tennis today"
                    : "Stay at home"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(""),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            onPressed: () {
              context.read<AICubit>().fetchAIPrediction(weatherData);
            },
            child: state is AILoading
                ? CircularProgressIndicator()
                : Text(
                    "Can I train today?",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
          ),
        );
      },
    );
  }
}