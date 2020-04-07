import 'package:dartz/dartz.dart';
import 'package:flutter_app/clean_architecture/core/error/failures.dart';
import 'package:flutter_app/clean_architecture/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
