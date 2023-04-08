import 'package:dartz/dartz.dart';
import 'package:test_farma/common/errors/failure.dart';
import 'package:test_farma/src/contacts/data/datasources/remote_datasource.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactEntity>>> getContacts();
}

class ContactRepositoryImpl implements ContactRepository {
  final ContactsRemoteDatasource _remoteDatasource;

  ContactRepositoryImpl(ContactsRemoteDatasource remoteDatasource)
      : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, List<ContactEntity>>> getContacts() async {
    try {
      final result = await _remoteDatasource.fetchContacts();

      final list = (result['data'] as List)
          .map((e) => ContactEntity.fromMap(e))
          .toList();

      return Right(list);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
