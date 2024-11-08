class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is NetworkError) {
      return 'Network Error: Please check your connection.';
    } else if (error is DatabaseError) {
      return 'Database Error: Something went wrong.';
    } else {
      return 'An unexpected error occurred.';
    }
  }
}

class NetworkError {}

class DatabaseError {}
