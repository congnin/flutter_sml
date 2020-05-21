import 'package:dartz/dartz.dart';
import 'package:firebase_dd_course/domain/auth/value_objects.dart';
import 'package:meta/meta.dart';

import 'auth_failure.dart';
import 'user.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
