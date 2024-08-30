import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';

class NoParams {}

abstract class UseCase<Type, Param1, Pram2> {
  Future<Either<Failure, Type>> call([Param1 param1, Pram2 param2]);
}
