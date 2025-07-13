import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String orgName;
  final String category;
  final String phone;
  final String email;
  final String? profileImageURL;
  final DateTime joinedAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.orgName,
    required this.category,
    required this.phone,
    required this.email,
    this.profileImageURL,
    required this.joinedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'orgName': orgName,
      'category': category,
      'phone': phone,
      'email': email,
      'profileImageURL': profileImageURL,
      'joinedAt': Timestamp.fromDate(joinedAt),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      orgName: json['orgName'] ?? '',
      category: json['category'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      profileImageURL: json['profileImageURL'],
      joinedAt: (json['joinedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? orgName,
    String? category,
    String? phone,
    String? email,
    String? profileImageURL,
    DateTime? joinedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      orgName: orgName ?? this.orgName,
      category: category ?? this.category,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}
