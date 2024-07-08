import 'package:blogapp/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract  interface class AuthRepository{
  Future<Either<AppFailure,String>>signUpWithEmailAndPassdword({
    required String name,
    required String email,
    required String password
  });

  Future<Either<AppFailure,String>>logInWithEmailPassword({
    required String email,
    required String password
  });
}