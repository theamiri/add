import 'package:aidra_drive/features/authentication/domain/entities/response_entities/session_entity.dart';
import 'package:hive/hive.dart';

class SessionModel extends SessionEntity {
  final int? id;
  final bool? isAdmin;
  final bool? isSystem;
  final String? name;
  final String? partnerId;
  final int? statusCode;
  final String? supportUrl;
  final int? uid;
  final UserContextModel? userContext;
  final String? username;

  SessionModel({
    required this.id,
    required this.isAdmin,
    required this.isSystem,
    required this.name,
    required this.partnerId,
    required this.statusCode,
    required this.supportUrl,
    required this.uid,
    required this.userContext,
    required this.username,
  });

  // From JSON to model
  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['id'],
      isAdmin: json['is_admin'],
      isSystem: json['is_system'],
      name: json['name'],
      partnerId: json['partner_id'],
      statusCode: json['statusCode'],
      supportUrl: json['support_url'],
      uid: json['uid'],
      userContext: UserContextModel.fromJson(json['user_context']),
      username: json['username'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_admin': isAdmin,
      'is_system': isSystem,
      'name': name,
      'partner_id': partnerId,
      'statusCode': statusCode,
      'support_url': supportUrl,
      'uid': uid,
      'user_context': userContext.toJson(),
      'username': username,
    };
  }
}

@HiveType(typeId: 1)
class UserContextModel extends UserContext {
  @HiveField(0)
  final String lang;

  @HiveField(1)
  final String tz;

  @HiveField(2)
  final int uid;

  UserContextModel({
    required this.lang,
    required this.tz,
    required this.uid,
  }) : super(
          lang: lang,
          tz: tz,
          uid: uid,
        );

  factory UserContextModel.fromJson(Map<String, dynamic> json) {
    return UserContextModel(
      lang: json['lang'] ?? '',
      tz: json['tz'] ?? '',
      uid: json['uid'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'tz': tz,
      'uid': uid,
    };
  }
}
