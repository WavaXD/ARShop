// กำหนดฟิลด์ข้อมูลของตาราง
class UserFields {
  // สร้างเป็นลิสรายการสำหรับคอลัมน์ฟิลด์
  static final List<String> values = [
    id,
    email,
    name,
    token,
    createdate,
    lastlogin,
    active
  ];

  // กำหนดแต่ละฟิลด์ของตาราง ต้องเป็น String ทั้งหมด
  static final String id = 'user_id';
  static final String email = 'user_email';
  static final String name = 'user_name';
  static final String token = 'user_token';
  static final String createdate = 'user_createdate';
  static final String lastlogin = 'user_lastlogin';
  static final String active = 'user_active';
}

// ส่วนของ Data Model
class User {
  final int id;
  final String email;
  final String? name;
  final String? token;
  final DateTime? createdate;
  final DateTime? lastlogin;
  final bool? active;

  // constructor
  const User({
    required this.id,
    required this.email,
    this.name,
    this.token,
    this.createdate,
    this.lastlogin,
    this.active,
  });

  // สำหรับแปลงข้อมูลจาก Json เป็น  object
  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int,
        email: json[UserFields.email] as String,
        name: json[UserFields.name] as String,
        token: json[UserFields.token] as String,
        createdate: DateTime.parse(json[UserFields.createdate] as String),
        lastlogin: DateTime.parse(json[UserFields.lastlogin] as String),
        active: json[UserFields.active] == 1,
      );

  // สำหรับแปลง  object เป็น Json
  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.email: email,
        UserFields.name: name,
        UserFields.token: token,
        UserFields.createdate: createdate?.toIso8601String() ?? "",
        UserFields.lastlogin: lastlogin?.toIso8601String() ?? "",
        UserFields.active: active != null ? 1 : 0,
      };
}
