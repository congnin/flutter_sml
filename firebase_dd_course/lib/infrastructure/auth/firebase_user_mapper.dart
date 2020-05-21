import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dd_course/domain/auth/user.dart';
import 'package:firebase_dd_course/domain/auth/value_objects.dart';
import 'package:firebase_dd_course/domain/core/value_objects.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseUserMapper {
  User toDomain(FirebaseUser _) {
    return _ == null
        ? null
        : User(
            id: UniqueId.fromUniqueString(_.uid),
            name: StringSingleLine(_.displayName ?? _.email.split('@').first),
            emailAddress: EmailAddress(_.email),
          );
  }
}
