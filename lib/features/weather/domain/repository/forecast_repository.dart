import 'package:ai_wheather/features/weather/domain/entity/repo_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/util/fail.dart';

abstract class ForecastRepo {
  Future<Either<Failures, ResponseEntity>> getForecast(String city);
}