import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/clean_architecture/core/error/failures.dart';
import 'package:flutter_app/clean_architecture/domain/entities/number_trivia.dart';
import 'package:flutter_app/clean_architecture/domain/repositories/number_trivia_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app/clean_architecture/core/usecases/usecase.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
