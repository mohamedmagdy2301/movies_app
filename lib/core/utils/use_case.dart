import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';

class NoParams {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call([Params params]);
}
