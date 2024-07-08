import 'package:blogapp/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<SuccessType,Params>{
  Future<Either<AppFailure,SuccessType>>call(Params params);
}