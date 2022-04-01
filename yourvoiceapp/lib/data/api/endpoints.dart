class Endpoints {

  static String get baseUrl => "http://64.227.102.13/api/v1/";

  //auth endpoints
  static const String userSignUp = 'create-account';

  //auth endpoints
  static const String userLogin = 'login';

  static const String forgotPassword = 'forgot-password';

  static const String resetPassword = 'reset-password';

  static const String addElection = 'election/add-election';

  static const String createElectionPosition = 'election/positions/add';
  static const String voters = 'election/5/dashboard';
  static const String candidates = 'election/5/preview-contestants';
  static const String update = 'admin/update-profile';
  static const String userDetails = 'user/me';
  static const String election = 'user/5/available-election-positions';
  static const String notify = 'admin/list-notifications';
}
