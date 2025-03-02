
import 'package:ai_wheather/features/weather/domain/usecase/tennis.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/repo_entity.dart';

part 'ai_state.dart';

class AICubit extends Cubit<AIState> {
  final GetAIPrediction getAIPrediction;

  AICubit(this.getAIPrediction) : super(AIInitial());

  Future<void> fetchAIPrediction(ResponseEntity weatherData) async {
    emit(AILoading());
    try {
      final prediction = await getAIPrediction.execute(weatherData);
      emit(AISuccess(prediction));
    } catch (e) {
      emit(AIFailure(e.toString()));
    }
  }
}
