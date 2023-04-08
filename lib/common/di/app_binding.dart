import 'package:get/get.dart';
import 'package:test_farma/common/api/api_service.dart';
import 'package:test_farma/common/cache/cache_manager.dart';
import 'package:test_farma/common/database/hive_service.dart';
import 'package:test_farma/src/auth/data/datasources/auth_datasource.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';
import 'package:test_farma/src/auth/presentation/controllers/auth/auth_controller.dart';
import 'package:test_farma/src/auth/presentation/controllers/sign_in/signin_controller.dart';
import 'package:test_farma/src/contacts/data/datasources/remote_datasource.dart';
import 'package:test_farma/src/contacts/domain/repositories/contact_repository.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contacts_controllers/contact_controller.dart';

class AppBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    // --- local DB --- //
    await Get.putAsync<HiveService>(() async {
      final HiveService service = HiveService();
      await service.init();
      return service;
    });

    // --- Remote API --- //
    Get.lazyPut<ApiService>(() => ApiService());

    // --- Cache --- //
    Get.lazyPut<CacheManager>(() => CacheManagerImpl(Get.find()));

    // --- Auth --- //
    Get.lazyPut<AuthDatasource>(() => AuthDatasource(
          cacheManager: Get.find(),
          apiService: Get.find(),
        ));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
    Get.lazyPut<SignInController>(() => SignInController(
          authController: Get.find(),
          authRepository: Get.find(),
        ));

    // --- Contacts --- //
    Get.lazyPut<ContactsRemoteDatasource>(
        () => ContactsRemoteDatasource(Get.find()));
    Get.lazyPut<ContactRepository>(() => ContactRepositoryImpl(
          remoteDatasource: Get.find(),
          cacheManager: Get.find(),
        ));
    Get.lazyPut<ContactsController>(() => ContactsController(Get.find()));
  }
}
