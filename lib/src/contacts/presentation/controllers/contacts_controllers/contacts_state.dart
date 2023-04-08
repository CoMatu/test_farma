import 'package:equatable/equatable.dart';
import 'package:test_farma/src/contacts/domain/entities/contact_entity.dart';

class ContactsState extends Equatable {
  final List<ContactEntity> contacts;

  const ContactsState(this.contacts);

  @override
  List<Object> get props => [];
}

class ContactsLoadingState extends ContactsState {
  const ContactsLoadingState(super.contacts);
}

class ContactsLoadedState extends ContactsState {
  const ContactsLoadedState(List<ContactEntity> contacts)
      : _contacts = contacts,
        super(contacts);

  final List<ContactEntity> _contacts;

  @override
  List<Object> get props => [_contacts];
}

class ContactsFailureState extends ContactsState {
  const ContactsFailureState({
    required List<ContactEntity> contacts,
    required String message,
  })  : _contacts = contacts,
        _message = message,
        super(contacts);

  final List<ContactEntity> _contacts;
  final String _message;

  @override
  List<Object> get props => [_contacts, _message];
}
