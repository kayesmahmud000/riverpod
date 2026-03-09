import 'package:riverpod_practice/model/address.dart';

class User {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String website;
  final Address address;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.website,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
    );
  }
}
