import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dd_course/domain/auth/i_auth_facade.dart';
import 'package:firebase_dd_course/domain/core/errors.dart';
import 'package:firebase_dd_course/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on Firestore {
  /// The user must be already authenticated when calling this method.
  /// Otherwise, throws [NotAuthenticatedError].
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return Firestore.instance
        .collection('users')
        .document(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');

  /// Nested subcollection under a [noteCollection]'s document.
  CollectionReference get todoCollection => collection('todos');
}
