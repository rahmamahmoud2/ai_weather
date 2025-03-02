import 'package:ai_wheather/core/injectable/injectable_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';



final getIt = GetIt.instance;

@InjectableInit(
    asExtension: true, 
  initializerName: 'init', 
  preferRelativeImports: true, 

)
void configureDependencies() => getIt.init();