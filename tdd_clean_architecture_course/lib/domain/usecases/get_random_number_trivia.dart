import 'package:dartz/dartz.dart';
import 'package:tdd_clean_architecture_course/core/error/failures.dart';
import 'package:tdd_clean_architecture_course/core/usecases/usecase.dart';
import 'package:tdd_clean_architecture_course/domain/entities/number_trivia.dart';
import 'package:tdd_clean_architecture_course/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
