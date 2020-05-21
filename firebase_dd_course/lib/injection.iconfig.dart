// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_dd_course/infrastructure/auth/firebase_user_mapper.dart';
import 'package:firebase_dd_course/infrastructure/auth/firebase_auth_facade.dart';
import 'package:firebase_dd_course/domain/auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_dd_course/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebase_dd_course/application/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<FirebaseUserMapper>(() => FirebaseUserMapper());
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthFacade>()));

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
          g<FirebaseAuth>(),
          g<GoogleSignIn>(),
          g<FirebaseUserMapper>(),
        ));
  }
}
