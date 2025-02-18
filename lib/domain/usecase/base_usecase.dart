import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<String, Out>> execute([In? input]);
}
