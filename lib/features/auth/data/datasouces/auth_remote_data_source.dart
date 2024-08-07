import 'package:blogapp/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailAndpassword(
      {required String name, required String email, required String password});
  Future<String> logInWithEmailAndpassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> logInWithEmailAndpassword(
      {required String email, required String password}) async {
        throw UnimplementedError();
      }

  @override
  Future<String> signUpWithEmailAndpassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
      if(response.user==null){
        throw const ServerException('User is null !');
      }
       return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
