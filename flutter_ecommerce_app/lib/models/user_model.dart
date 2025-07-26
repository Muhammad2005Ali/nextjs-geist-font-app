class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final List<Address> addresses;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    this.addresses = const [],
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      profileImage: json['profile_image'],
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((address) => Address.fromJson(address))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_image': profileImage,
      'addresses': addresses.map((address) => address.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class Address {
  final String id;
  final String title;
  final String fullName;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String? phone;
  final bool isDefault;

  Address({
    required this.id,
    required this.title,
    required this.fullName,
    required this.addressLine1,
    this.addressLine2 = '',
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.phone,
    this.isDefault = false,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      fullName: json['full_name'] ?? '',
      addressLine1: json['address_line_1'] ?? '',
      addressLine2: json['address_line_2'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      zipCode: json['zip_code'] ?? '',
      country: json['country'] ?? '',
      phone: json['phone'],
      isDefault: json['is_default'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'full_name': fullName,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'country': country,
      'phone': phone,
      'is_default': isDefault,
    };
  }

  String get fullAddress {
    return '$addressLine1${addressLine2.isNotEmpty ? ', $addressLine2' : ''}, $city, $state $zipCode, $country';
  }
}
