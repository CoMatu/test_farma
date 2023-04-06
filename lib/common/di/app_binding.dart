import 'package:get/get.dart';
import 'package:test_farma/common/api/api_service.dart';
import 'package:test_farma/common/cache/cache_manager.dart';
import 'package:test_farma/common/database/database_controller.dart';
import 'package:test_farma/src/auth/data/datasources/auth_datasource.dart';
import 'package:test_farma/src/auth/domain/repositories/auth_repository.dart';
import 'package:test_farma/src/auth/presentation/controller/auth_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // --- Remote API --- //
    Get.lazyPut<ApiService>(() => ApiService());

    // --- local DB --- //
    Get.lazyPut<DbController>(() => DbController());

    // --- Cache --- //
    Get.lazyPut<CacheManager>(() => CacheManagerImpl());

    // --- Auth --- //
    Get.lazyPut<AuthDatasource>(() => AuthDatasource());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));

    // --- ... --- //
  }
}
