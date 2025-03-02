
import '../entity/repo_entity.dart';

abstract class AIRepository {
  Future<List<dynamic>> getPredictionFromWeatherData(ResponseEntity weatherData);
}
