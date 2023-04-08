import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class ContactEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String? middleName;
  @HiveField(2)
  final String surname;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final bool favorite;
  @HiveField(5)
  final List<String> tags;

  const ContactEntity({
    required this.name,
    this.middleName,
    required this.surname,
    required this.phone,
    required this.favorite,
    required this.tags,
  });

  @override
  List<Object> get props {
    return [
      name,
      surname,
      phone,
      favorite,
      tags,
    ];
  }

  ContactEntity copyWith({
    String? name,
    String? middleName,
    String? surname,
    String? phone,
    bool? favorite,
    List<String>? tags,
  }) {
    return ContactEntity(
      name: name ?? this.name,
      middleName: middleName ?? this.middleName,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      favorite: favorite ?? this.favorite,
      tags: tags ?? this.tags,
    );
  }

  @override
  String toString() {
    return 'ContactEntity(name: $name, middleName: $middleName, surname: $surname, phone: $phone, favorite: $favorite), tags: $tags';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'middleName': middleName,
      'surname': surname,
      'phone': phone,
      'favorite': favorite,
      'tags': tags,
    };
  }

  factory ContactEntity.fromMap(Map<String, dynamic> map) {
    return ContactEntity(
      name: map['name'] ?? '',
      middleName: map['middleName'] ?? '',
      surname: map['surname'],
      phone: map['phone'] ?? '',
      favorite: map['favorite'] ?? false,
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactEntity.fromJson(String source) =>
      ContactEntity.fromMap(json.decode(source));
}
