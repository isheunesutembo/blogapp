import 'package:blogapp/core/error/exceptions.dart';
import 'package:blogapp/core/error/failure.dart';
import 'package:blogapp/features/auth/data/datasouces/auth_remote_data_source.dart';
import 'package:blogapp/features/auth/domain/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppFailure, String>> logInWithEmailPassword({required String email, required String password}) {
    // TODO: implement logInWithEmailPassword
   return  throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, String>> signUpWithEmailAndPassdword({required String name, required String email, required String password})async {
    try{
     final userId=await remoteDataSource.signUpWithEmailAndpassword(name: name, email: email, password: password);
     return right(userId);
    }on ServerException catch(e){
     return left(AppFailure(e.message));
    }
  }

}