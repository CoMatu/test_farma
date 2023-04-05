import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String surname;

  const UserModel({required this.name, required this.surname});

  factory UserModel.empty() => const UserModel(name: '', surname: '');

  @override
  List<Object?> get props => [name, surname];

  @override
  String toString() {
    return 'UserModel(name: $name, surname: $surname)';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        surname: json['surname'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['surname'] = surname;
    return data;
  }
}
