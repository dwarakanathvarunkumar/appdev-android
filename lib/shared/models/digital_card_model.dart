import 'package:cloud_firestore/cloud_firestore.dart';

class DigitalCardModel {
  final String id;
  final String userId;
  final String template;
  final String name;
  final String designation;
  final String orgName;
  final String phone;
  final String email;
  final String? whatsapp;
  final String? address;
  final String? website;
  final Map<String, String> socialLinks;
  final String qrCodeLink;
  final DateTime createdAt;
  final DateTime updatedAt;

  DigitalCardModel({
    required this.id,
    required this.userId,
    required this.template,
    required this.name,
    required this.designation,
    required this.orgName,
    required this.phone,
    required this.email,
    this.whatsapp,
    this.address,
    this.website,
    required this.socialLinks,
    required this.qrCodeLink,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'template': template,
      'name': name,
      'designation': designation,
      'orgName': orgName,
      'phone': phone,
      'email': email,
      'whatsapp': whatsapp,
      'address': address,
      'website': website,
      'socialLinks': socialLinks,
      'qrCodeLink': qrCodeLink,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory DigitalCardModel.fromJson(Map<String, dynamic> json) {
    return DigitalCardModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      template: json['template'] ?? 'modern-blue',
      name: json['name'] ?? '',
      designation: json['designation'] ?? '',
      orgName: json['orgName'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      whatsapp: json['whatsapp'],
      address: json['address'],
      website: json['website'],
      socialLinks: Map<String, String>.from(json['socialLinks'] ?? {}),
      qrCodeLink: json['qrCodeLink'] ?? '',
      createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  DigitalCardModel copyWith({
    String? id,
    String? userId,
    String? template,
    String? name,
    String? designation,
    String? orgName,
    String? phone,
    String? email,
    String? whatsapp,
    String? address,
    String? website,
    Map<String, String>? socialLinks,
    String? qrCodeLink,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DigitalCardModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      template: template ?? this.template,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      orgName: orgName ?? this.orgName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      whatsapp: whatsapp ?? this.whatsapp,
      address: address ?? this.address,
      website: website ?? this.website,
      socialLinks: socialLinks ?? this.socialLinks,
      qrCodeLink: qrCodeLink ?? this.qrCodeLink,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
