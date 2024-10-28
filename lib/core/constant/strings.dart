abstract class Strings {
  //global strings
  static const appTitle = 'Aidra Drive';
  static const baseUrl = 'https://live.aidra.tech';

  //hive strings
  static const userBox = 'user_box';
  static const userKey = 'current_user';

  //failureMessages
  //TODO: need to be placed inside translation file since they not statics
  static const storageFailureMessage =
      'An error occurred while accessing device storage. Please check your device storage permission and try again';
  static const networkFailureMessage =
      'A network error occurred. Please check your connection and try again';
  static const String unknownFailureMessage =
      "An unknown error occurred. Please try again later";
  static const String timeoutFailureMessage =
      "The server took too long to respond. Please try again later";
  static const String certificateFailureMessage =
      "The server took too long to respond. Please try again later";
  static const String connectionErrorMessage =
      "Failed to connect to the server. Please check your internet connection and try again";
  static const String badResponseMessage =
      "An error occurred while processing your request. Please try again";
}
