import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProfilesRecord extends FirestoreRecord {
  ProfilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _bio = snapshotData['bio'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profiles');

  static Stream<ProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfilesRecord.fromSnapshot(s));

  static Future<ProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfilesRecord.fromSnapshot(s));

  static ProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfilesRecordData({
  String? username,
  String? bio,
  DateTime? createdAt,
  DateTime? updatedAt,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'bio': bio,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfilesRecordDocumentEquality implements Equality<ProfilesRecord> {
  const ProfilesRecordDocumentEquality();

  @override
  bool equals(ProfilesRecord? e1, ProfilesRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.bio == e2?.bio &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ProfilesRecord? e) => const ListEquality()
      .hash([e?.username, e?.bio, e?.createdAt, e?.updatedAt, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ProfilesRecord;
}
