import 'package:ai_wheather/features/auth/domain/auth/entity/user_entity.dart';
import 'package:ai_wheather/features/auth/domain/auth/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth= FirebaseAuth.instance;
    @override
  Future<UserEntity?> signUp(String name, String email, String password) async {
    
    try {
      
      UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
      UserEntity user=UserEntity(uid: userCredential.user!.uid, name: name, email: email);
      return user;
    } catch (e) {
      print(e);
 return null;
      
    }
   
  }
  @override
  Future<UserEntity?> signIn(String email, String password) async{
   
   
   try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
   } catch (e) {
     
     print(e);
     return null;
   }
  }


}