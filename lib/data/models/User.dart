// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  Account account;
  String accessToken;
  String refreshToken;

  User({
    required this.account,
    required this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        account: Account.fromJson(json["account"]),
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}

class Account {
  int id;
  String email;
  // bool emailVerified;
  // bool phoneVerified;
  // String phoneNumber;
  String firstname;
  // String surname;
  // String lastname;
  // String fullName;
  // int userId;
  // String biography;
  // String profilePicName;
  // String profilePic;
  // String watchlistPicName;
  // String watchlistPic;
  // dynamic socketUuid;
  // bool renewPackage;
  // int renewCount;
  // dynamic accountPackageStart;
  // dynamic accountPackageExpiration;
  // int remainingDays;
  // dynamic nextExpiration;
  // dynamic forgotPasswordCode;
  // dynamic forgotPasswordExpiration;
  // String lastLoginIp;
  // dynamic lastLoginDate;
  // dynamic botChatId;
  // dynamic adminSupportBotId;
  // String adminSupportBotUsername;
  // String telegramUsername;
  // String telegramCode;
  // String loginAsUser;
  // DateTime createdAt;
  // DateTime updatedAt;
  // AccountType accountType;

  Account({
    required this.id,
    required this.email,
    // required this.emailVerified,
    // required this.phoneVerified,
    // required this.phoneNumber,
    required this.firstname,
    // required this.surname,
    // required this.lastname,
    // required this.fullName,
    // required this.userId,
    // required this.biography,
    // required this.profilePicName,
    // required this.profilePic,
    // required this.watchlistPicName,
    // required this.watchlistPic,
    // required this.socketUuid,
    // required this.renewPackage,
    // required this.renewCount,
    // required this.accountPackageStart,
    // required this.accountPackageExpiration,
    // required this.remainingDays,
    // required this.nextExpiration,
    // required this.forgotPasswordCode,
    // required this.forgotPasswordExpiration,
    // required this.lastLoginIp,
    // required this.lastLoginDate,
    // required this.botChatId,
    // required this.adminSupportBotId,
    // required this.adminSupportBotUsername,
    // required this.telegramUsername,
    // required this.telegramCode,
    // required this.loginAsUser,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.accountType,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        email: json["email"],
        // emailVerified: json["emailVerified"],
        // phoneVerified: json["phoneVerified"],
        // phoneNumber: json["phoneNumber"],
        firstname: json["firstname"],
        // surname: json["surname"],
        // lastname: json["lastname"],
        // fullName: json["fullName"],
        // userId: json["userId"],
        // biography: json["biography"],
        // profilePicName: json["profilePicName"],
        // profilePic: json["profilePic"],
        // watchlistPicName: json["watchlistPicName"],
        // watchlistPic: json["watchlistPic"],
        // socketUuid: json["socketUUID"],
        // renewPackage: json["renewPackage"],
        // renewCount: json["renewCount"],
        // accountPackageStart: json["accountPackageStart"],
        // accountPackageExpiration: json["accountPackageExpiration"],
        // remainingDays: json["remainingDays"],
        // nextExpiration: json["nextExpiration"],
        // forgotPasswordCode: json["forgotPasswordCode"],
        // forgotPasswordExpiration: json["forgotPasswordExpiration"],
        // lastLoginIp: json["lastLoginIp"],
        // lastLoginDate: json["lastLoginDate"],
        // botChatId: json["botChatId"],
        // adminSupportBotId: json["adminSupportBotId"],
        // adminSupportBotUsername: json["adminSupportBotUsername"],
        // telegramUsername: json["telegramUsername"],
        // telegramCode: json["telegramCode"],
        // loginAsUser: json["loginAsUser"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        // accountType: AccountType.fromJson(json["accountType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        // "emailVerified": emailVerified,
        // "phoneVerified": phoneVerified,
        // "phoneNumber": phoneNumber,
        "firstname": firstname,
        // "surname": surname,
        // "lastname": lastname,
        // "fullName": fullName,
        // "userId": userId,
        // "biography": biography,
        // "profilePicName": profilePicName,
        // "profilePic": profilePic,
        // "watchlistPicName": watchlistPicName,
        // "watchlistPic": watchlistPic,
        // "socketUUID": socketUuid,
        // "renewPackage": renewPackage,
        // "renewCount": renewCount,
        // "accountPackageStart": accountPackageStart,
        // "accountPackageExpiration": accountPackageExpiration,
        // "remainingDays": remainingDays,
        // "nextExpiration": nextExpiration,
        // "forgotPasswordCode": forgotPasswordCode,
        // "forgotPasswordExpiration": forgotPasswordExpiration,
        // "lastLoginIp": lastLoginIp,
        // "lastLoginDate": lastLoginDate,
        // "botChatId": botChatId,
        // "adminSupportBotId": adminSupportBotId,
        // "adminSupportBotUsername": adminSupportBotUsername,
        // "telegramUsername": telegramUsername,
        // "telegramCode": telegramCode,
        // "loginAsUser": loginAsUser,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        // "accountType": accountType.toJson(),
      };
}

class AccountType {
  int id;
  String title;
  int price;
  int salePrice;
  int priority;
  int timeLimit;
  String description;
  String package;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;

  AccountType({
    required this.id,
    required this.title,
    required this.price,
    required this.salePrice,
    required this.priority,
    required this.timeLimit,
    required this.description,
    required this.package,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        salePrice: json["salePrice"],
        priority: json["priority"],
        timeLimit: json["timeLimit"],
        description: json["description"],
        package: json["package"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "salePrice": salePrice,
        "priority": priority,
        "timeLimit": timeLimit,
        "description": description,
        "package": package,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
