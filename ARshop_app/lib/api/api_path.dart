class ApiUrl {
  // ค่าตัวแปรสำหรับใช้งานจริง
  static const String liveBaseURL = "https://localhost/demo/api";
  // กรณีทดสอบที่ localhost android ใช้ค่าตามนี้ได้เลย เปลี่ยน path และ port เท่านั้น
  static const String localBaseURL = "https://10.0.2.2:443/demo/api";

  static const String baseURL = localBaseURL; // ทดสอบที่เครื่องใช้ค่านี้
  static const String login = baseURL + "/user/authen";
  static const String register = baseURL + "/user/create";
}
