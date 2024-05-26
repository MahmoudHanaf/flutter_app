class EndPoints {
  static const String baseUrl = 'http://192.168.1.11/Teachers/';
  //*Register
  static const String signup = '${baseUrl}auth/sign_up.php';
  static const String login = '${baseUrl}auth/login.php';

  static const String selectLevels = '${baseUrl}Select_levels.php';

  //*Home
  static const String home = '${baseUrl}HomeScreen.php';

  //*Exams
  static const String allExams = '${baseUrl}Select_All_Exams.php';
  static const String examQuestions = '${baseUrl}Select_Exames_Questions.php';
  static const String submitExam = '${baseUrl}Insert_Degree.php';

  //*Score
  static const String examScore = '${baseUrl}Select_Results.php';

  //http://192.168.1.35/Teachers/upload_video/1.1 Integers.avi
}
