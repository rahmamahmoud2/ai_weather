import 'package:ai_wheather/core/injectable/injectable.dart';
import 'package:ai_wheather/core/service/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/cubit/forecast_cubit.dart';
import '../widgets/forecast_body.dart';

// ignore: must_be_immutable
class ForecastPage extends StatelessWidget {
  ForecastPage({super.key});

  var bloc = getIt<ForecastCubit>();
  var location = LocationService();

  @override
  Widget build(BuildContext context) {
    location.getLocation().then(
      (value) {
        if (value != null) {
          bloc.getForecast('${value.latitude},${value.longitude}');
        }
      },
    );
    return SafeArea(
      child: Scaffold(
     
        body: BlocBuilder<ForecastCubit, ForecastState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ForecastLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ForecastFailureState) {
              return Center(
                child: Text(state.failures.ErrorMessage),
              );
            } else if (state is ForecastSuccessState) {
              return ForecastScreenBody(
                response: state.responseEntity,
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}