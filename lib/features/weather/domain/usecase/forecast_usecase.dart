import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/util/fail.dart';
import '../entity/repo_entity.dart';
import '../repository/forecast_repository.dart';


@injectable
class ForecastUseCase {
  ForecastRepo forecastRepo;

  ForecastUseCase(this.forecastRepo);

  Future<Either<Failures, ResponseEntity>> call(String city) =>
      forecastRepo.getForecast(city);
}