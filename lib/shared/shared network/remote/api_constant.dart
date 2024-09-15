abstract class ApiConstant {
  static const String _baseUrl = 'http://192.168.43.39:3000/api';
  static const String baseUrl = 'http://192.168.43.39:3000/api';
  static const String base = 'http://192.168.43.39:3000';
  static const String login = '$_baseUrl/login';
  static const String specialists = '$_baseUrl/specialists';
  static const String rooms = '$_baseUrl/nonSpecialists/rooms';

  static String getAllClinicalForm(patientId) =>
      "$_baseUrl/patient/getAllClinicalForm/$patientId";
  static String getclinicalForm(formId, patientId) =>
      "$_baseUrl/clinicalForm/$formId/$patientId";
  //
  static String addPatientHistory(patientId) =>
      "$_baseUrl/generalInformation/patientHistory/$patientId";
  static String editPatientHistory(patientId) =>
      "$_baseUrl/generalInformation/editcomplentsDetails/$patientId";
  //
  static String addcomplent(patientId) =>
      "$_baseUrl/generalInformation/complent/$patientId";
  static String editaddcomplent(patientId) =>
      "$_baseUrl/generalInformation/editcomplentsDetails/$patientId";

  static String companionsComplents(patientId) =>
      "$_baseUrl/generalInformation/CompanionsComplents/$patientId";
  static String editcompanionsComplents(patientId) =>
      "$_baseUrl/generalInformation/editCompanionsComplents/$patientId";
  //
  static String addOtherSystem(patientId) => "$_baseUrl/otherSystem/$patientId";
  static String editOtherSystem(patientId) =>
      "$_baseUrl/otherSystem/editotherSystem/$patientId";

  static String getPatientByRoom(roomId) =>
      "$_baseUrl/patient/getPatientByRoom/$roomId";
}
