import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/repo/home_repo.dart';

class NoParams {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call([Params params]);
}