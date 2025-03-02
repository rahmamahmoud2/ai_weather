import 'package:ai_wheather/core/util/fail.dart';
import 'package:ai_wheather/features/weather/data/data_source/forcast_source_imp.dart';
import 'package:ai_wheather/features/weather/domain/entity/repo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/forecast_repository.dart';


@Injectable(as: ForecastRepo)
class ForecastRepoImpl implements ForecastRepo {
  ForecastDataSource forecastDataSource;

  ForecastRepoImpl(this.forecastDataSource);

  @override
  Future<Either<Failures, ResponseEntity>> getForecast(String city) async {
    var data = await forecastDataSource.getForecast(city);
    return data.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
