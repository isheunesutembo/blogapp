// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogapp/features/auth/domain/auth_repository.dart';
import 'package:blogapp/features/auth/domain/auth_repository.dart';
import 'package:blogapp/features/auth/domain/auth_repository.dart';
import 'package:fpdart/src/either.dart';

import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/core/usecase/usecase.dart';

class UserSignUp implements UserCase<String,UserSignUpParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<AppFailure, String>> call(UserSignUpParams params)async {
   return  await authRepository.signUpWithEmailAndPassdword(name: params.name, email: params.email, password: params.password);
  }
  
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
