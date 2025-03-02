import 'package:ai_wheather/features/auth/domain/auth/entity/user_entity.dart';
import 'package:ai_wheather/features/auth/domain/auth/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> signUp(String name, String email, String password) async {
    emit(AuthLoading());
    final user = await authRepository.signUp(name, email, password);
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure("Failed to sign up"));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final user = await authRepository.signIn(email, password);
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFailure("Invalid email or password"));
    }
  }
}
