import 'dart:io';

import '/src/network/exceptions/base_api_exception.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message)
      : super(
            httpCode: HttpStatus.serviceUnavailable,
            message: message,
            status: "");
}
