
import 'package:ai_wheather/features/weather/data/repository/ai_repository_impl.dart';
import 'package:ai_wheather/features/weather/data/repository/forecast_repo_imp.dart';
import 'package:ai_wheather/features/weather/domain/repository/ai_repository.dart';
import 'package:ai_wheather/features/weather/domain/repository/forecast_repository.dart';
import 'package:ai_wheather/features/weather/domain/usecase/forecast_usecase.dart';
import 'package:ai_wheather/features/weather/domain/usecase/tennis.dart';

import 'package:ai_wheather/features/weather/presentation/controller/cubit/ai_cubit.dart';
import 'package:ai_wheather/features/weather/presentation/controller/cubit/forecast_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


import 'core/api/api_manger.dart';
import 'features/weather/data/data_source/forcast_source_imp.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);

 


   // ✅ Register API Manager
  sl.registerLazySingleton<ApiManger>(() => ApiManger());

  // ✅ Register Data Source
  sl.registerLazySingleton<ForecastDataSource>(
      () => ForcastDataSourceImp(apiManger: sl<ApiManger>(), api: sl<ApiManger>()));

  // ✅ Register Repository
  sl.registerLazySingleton<ForecastRepo>(
      () => ForecastRepoImpl(sl<ForecastDataSource>()));

  // ✅ Register Use Case
  sl.registerLazySingleton<ForecastUseCase>(
      () => ForecastUseCase(sl<ForecastRepo>()));

  // ✅ Register ForecastCubit (THIS WAS MISSING!)
  sl.registerFactory<ForecastCubit>(() => ForecastCubit(sl<ForecastUseCase>(), forecastUseCase: sl<ForecastUseCase>()));


  
  sl.registerLazySingleton(() =>GetAIPrediction (sl()));
  sl.registerFactory(() => AICubit(sl()));
sl.registerLazySingleton<AIRepository>(() => AIRepositoryImpl());
  }

@module
abstract class AppModule {
 
}

