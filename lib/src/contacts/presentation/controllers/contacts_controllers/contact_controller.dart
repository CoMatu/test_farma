import 'package:get/get.dart';
import 'package:test_farma/common/errors/failure.dart';
import 'package:test_farma/src/contacts/domain/repositories/contact_repository.dart';
import 'package:test_farma/src/contacts/presentation/controllers/contacts_controllers/contacts_state.dart';

class ContactsController extends GetxController {
  final ContactRepository _contactRepository;

  final _contactsState = const ContactsState([]).obs;

  ContactsController(ContactRepository contactRepository)
      : _contactRepository = contactRepository;

  ContactsState get state => _contactsState.value;

  @override
  void onInit() {
    getContacts();
    super.onInit();
  }

  Future<void> getContacts() async {
    final result = await _contactRepository.getContacts();

    result.fold(
      (l) => _contactsState.value = ContactsFailureState(
          contacts: _contactsState.value.contacts,
          message: (l as ServerFailure).message),
      (r) => _contactsState.value = ContactsLoadedState(r),
    );
  }
}
