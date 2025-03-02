import 'package:ai_wheather/features/auth/domain/auth/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signUp( String name,String email, String password);
  Future<UserEntity?> signIn(String email, String password);
 
}