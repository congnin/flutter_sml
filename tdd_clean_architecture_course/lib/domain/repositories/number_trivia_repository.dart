import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture_course/core/error/failures.dart';

import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
