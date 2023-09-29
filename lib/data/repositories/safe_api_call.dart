import 'package:dio/dio.dart';
import '../../domain/data_result/data_result.dart';

Future<DataResult<T>> safeApiCall<T>(
    {required DataResult<T> Function(dynamic) processRemoteResult,
      required Future Function() apiCall}) async {
  try {
    var response = await apiCall();
    return processRemoteResult(response);
  } catch (e) {
    if (e is DioException) {
      final response = e.response;
      if (response != null) {
        return ErrorResult(
            code: response.statusCode,
            message: response.statusMessage ?? "");
      }
    }
    return ErrorResult(code: null, message: 'Something went wrong');
  }
}

