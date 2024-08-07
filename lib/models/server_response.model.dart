import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/helpers/json_helper.dart';

class ServerResponseModel<T> {
  ServerResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> dataJson) dataFromJson,
  )   : success = json['success'] as bool,
        apiError = json['error'] == null
            ? null
            : JsonHelper.apiErrorFromJson(json['error']),
        data = json['data'] != null
            ? dataFromJson(Map<String, dynamic>.from(json['data']))
            : null;

  final ApiError? apiError;
  final bool success;
  final T? data;
}
