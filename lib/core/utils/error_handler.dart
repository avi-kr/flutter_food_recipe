import 'package:recipe/core/shared/app_strings.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is NetworkError) {
      return AppStrings.networkError;
    } else if (error is DatabaseError) {
      return AppStrings.databaseError;
    } else {
      return AppStrings.unexpectedError;
    }
  }
}

class NetworkError {}

class DatabaseError {}
