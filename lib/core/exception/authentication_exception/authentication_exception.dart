import 'package:laundry_bin/core/exception/base_exception.dart';

final class AuthException extends BaseException {
  const AuthException(String? message)
      : super(message: message ?? 'Unknown Exception');
}
