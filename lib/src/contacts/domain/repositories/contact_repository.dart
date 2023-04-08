import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_multitool/constants.dart';
import 'package:test_farma/common/cache/cache_manager.dart';
import 'package:test_farma/common/cache/cache_model.dart';
import 'package:test_farma/common/errors/failure.dart';
import 'package:test_farma/environment_config.dart';
import 'package:test_farma/src/contacts/data/datasources/remote_datasource.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactEntity>>> getContacts();
}

class ContactRepositoryImpl implements ContactRepository {
  final ContactsRemoteDatasource _remoteDatasource;
  final CacheManager _cacheManager;

  ContactRepositoryImpl({
    required ContactsRemoteDatasource remoteDatasource,
    required CacheManager cacheManager,
  })  : _remoteDatasource = remoteDatasource,
        _cacheManager = cacheManager;

  @override
  Future<Either<Failure, List<ContactEntity>>> getContacts() async {
    final currentTime = DateTime.now();
    final localData =
        await _cacheManager.getUserRequestDataOnString('contacts');

    if (localData != null) {
      if (currentTime.isBefore(localData.expired)) {
        final map = jsonDecode(localData.jsonData) as List;
        final res = map.map((e) => ContactEntity.fromMap(e)).toList();
        log('${commentBgGreen}RETURN_CACHED_DATA: $map');
        return Right(res);
      } else {
        return await apiRequest();
      }
    } else {
      return await apiRequest();
    }
  }

  Future<Either<Failure, List<ContactEntity>>> apiRequest() async {
    try {
      final result = await _remoteDatasource.fetchContacts();

      // --- кешируем запрос --- //
      final expired = DateTime.now()
          .add(const Duration(seconds: EnvironmentConfig.cacheTime));
      final CacheModel model = CacheModel(
          url: EnvironmentConfig.jsonUrl,
          expired: expired,
          jsonData: jsonEncode(result['data']));

      await _cacheManager.writeUserRequestDataWithTime('contacts', model);

      // --- парсим ответ сервера --- //
      final list = (result['data'] as List)
          .map((e) => ContactEntity.fromMap(e))
          .toList();
      log('${commentBgGreen}RETURN_SERVER_DATA: $list');

      return Right(list);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
