
import '../../local/generic_factory.dart';

import '../../../../constants/constant.dart';

import './response_code.dart';

class BaseApiResponse<T> {
  final String? status;
  final T? data;
  final String? error;

  BaseApiResponse.fromJson(json, InitGeneric<T> dataFactory)
      : status = json[Keys.status] ?? '',
        data = json[Keys.data] == null ? null : dataFactory(json[Keys.data]),
        error = json[Keys.message] ?? '';

  bool get isSuccess => status == ResponseCode.success;
}
