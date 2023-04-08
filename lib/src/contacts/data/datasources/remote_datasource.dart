import 'package:test_farma/common/api/api_service.dart';

class ContactsRemoteDatasource {
  final ApiService _apiService;

  ContactsRemoteDatasource(ApiService apiService) : _apiService = apiService;

  Future<Map<String, dynamic>> fetchContacts() async {
    return await _apiService.getContacts();
  }
}
