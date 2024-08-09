import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class StatusResponse {
  final int statusCode;
  final dynamic error;
  final String message;
  final List<Map<String, dynamic>> data;

  const StatusResponse(
      {required this.statusCode,
      required this.error,
      required this.message,
      required this.data});

  factory StatusResponse.fromJson(Map<String, dynamic> json) =>
      _$StatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusResponseToJson(this);
}
