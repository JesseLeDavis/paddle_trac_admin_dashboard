// ignore_for_file: lines_longer_than_80_chars

// Package imports:
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:paddle_trac_admin_dashboard/infrastructure/api_error/api_error.dart';
import 'package:paddle_trac_admin_dashboard/models/server_response.model.dart';

export 'package:cloud_firestore/cloud_firestore.dart';

typedef DataType = Map<String, dynamic>;

/// provides access to:
///
/// - collection
/// - doc
/// - batch
/// - userId
mixin FirebaseAuthServerMixin {
  static final _functions = FirebaseFunctions.instance;

  HttpsCallable Function(String, {HttpsCallableOptions? options})
      get httpsCallable => _functions.httpsCallable;

  HttpsCallableOptions httpsCallableOptions({
    Duration timeout = const Duration(seconds: 5),
  }) =>
      HttpsCallableOptions(timeout: timeout);

  Future<Either<ApiError, T>> serverResponse<T>({
    Map<String, dynamic> params = const {},
    required String httpsCallableKey,
    required T Function(Map<String, dynamic> dataJson) dataFromJson,
  }) async {
    try {
      final callableResult = await FirebaseFunctions.instance
          .httpsCallable(httpsCallableKey)
          .call<Map<String, dynamic>>(params);

      final json = _convertMaps(callableResult.data);

      final serverResponse = ServerResponseModel<T>.fromJson(
        json,
        dataFromJson,
      );

      if (serverResponse.apiError != null) {
        return left(serverResponse.apiError!);
      } else if (serverResponse.data == null) {
        return left(ApiError.unknownError);
      }

      return right(serverResponse.data as T);
    } catch (e) {
      return left(ApiError.unknownError);
    }
  }

  Map<String, dynamic> _convertMaps(Map map) {
    for (final key in map.keys) {
      final value = map[key];
      if (value is Map) {
        map[key] = Map<String, dynamic>.from(value);
        map[key] = _convertMaps(map[key]);
      } else if (value is List) {
        for (var i = 0; i < value.length; i++) {
          final item = value[i];
          if (item is Map) {
            value[i] = _convertMaps(item);
          }
        }

        map[key] = value;
      }
    }

    return Map<String, dynamic>.from(map);
  }
}
