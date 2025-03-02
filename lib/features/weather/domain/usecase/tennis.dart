import 'package:ai_wheather/features/weather/domain/entity/repo_entity.dart';
import 'package:ai_wheather/features/weather/domain/repository/ai_repository.dart';

class GetAIPrediction {
  final AIRepository repository;

  GetAIPrediction(this.repository);

  Future<List> execute(ResponseEntity weatherData) {
    return repository.getPredictionFromWeatherData(weatherData);
  }
}
