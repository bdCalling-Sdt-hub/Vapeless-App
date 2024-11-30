import 'package:flutter/foundation.dart';

class GroupGoalModel {
  final String status;
  final String statusCode;
  final String message;
  final List<GroupAttributes> data;

  GroupGoalModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory GroupGoalModel.fromJson(Map<String, dynamic> json) {
    return GroupGoalModel(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? "",
      message: json['message'] ?? '',
      data: (json['data']?['attributes'] ?? [])
          .map<GroupAttributes>(
              (e) => GroupAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'message': message,
      'data': {
        'attributes': data.map((e) => e.toJson()).toList(),
      },
    };
  }
}

class GroupAttributes {
  final String id;
  final GroupDetails groupDetails;
  final List<Participant> participants;
  final int totalVapeCount;

  GroupAttributes({
    required this.id,
    required this.groupDetails,
    required this.participants,
    required this.totalVapeCount,
  });

  factory GroupAttributes.fromJson(Map<String, dynamic> json) {
    return GroupAttributes(
      id: json['_id'] ?? '',
      groupDetails: GroupDetails.fromJson(json['groupDetails'] ?? {}),
      participants: (json['participants'] ?? [])
          .map<Participant>((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalVapeCount: json['totalVapeCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'groupDetails': groupDetails.toJson(),
      'participants': participants.map((e) => e.toJson()).toList(),
      'totalVapeCount': totalVapeCount,
    };
  }
}

class GroupDetails {
  final DateTime startDate;
  final DateTime endDate;
  final int duration;

  GroupDetails({
    required this.startDate,
    required this.endDate,
    required this.duration,
  });

  factory GroupDetails.fromJson(Map<String, dynamic> json) {
    return GroupDetails(
      startDate: DateTime.tryParse(json['startDate'] ?? '') ?? DateTime.now(),
      endDate: DateTime.tryParse(json['endDate'] ?? '') ?? DateTime.now(),
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'duration': duration,
    };
  }
}

class Participant {
  final String userId;
  final String image;
  final int vapeCount;

  Participant({
    required this.userId,
    required this.image,
    required this.vapeCount,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      userId: json['userId'] ?? '',
      image: json['image'] ?? '',
      vapeCount: json['vapeCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'image': image,
      'vapeCount': vapeCount,
    };
  }
}
