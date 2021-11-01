//#region - System -
enum MenuState { home, favourite, message, profile }
//#endregion

//#region - Issue -
enum IssueCategory {
  brokenTire, //Hỏng lốp
  brokenBrake, //Hỏng phanh
  brokenChain, //Hỏng xích
  brokenEngine, //Hỏng động cơ, chết máy
  other, //Lỗi khác
}

extension IssueCategoryExtension on IssueCategory {
  String get name {
    switch (this) {
      case IssueCategory.brokenTire:
        return 'Lốp xe bị hỏng';
      case IssueCategory.brokenBrake:
        return 'Phanh bị hỏng';
      case IssueCategory.brokenChain:
        return 'Xích bị hỏng';
      case IssueCategory.brokenEngine:
        return 'Động cơ bị hỏng.';
      case IssueCategory.other:
        return 'Khác';
      default:
        return "_ERROR_";
    }
  }
}

enum IssueStatus {
  sent,
  waitMemberConfirm,
  memberConfirmPartner,
  canceledByMember,
  canceledByPartner,
  succeeded,
}

extension IssueStatusExtension on IssueStatus {
  String get name {
    switch (this) {
      case IssueStatus.sent:
        return 'Vừa gửi đi';
      case IssueStatus.waitMemberConfirm:
        return 'Chờ khách hàng xác nhận người giúp đỡ';
      case IssueStatus.memberConfirmPartner:
        return 'Đang thực hiện'; //Khách hàng đã xác nhận người giúp đỡ (đang thực hiện)
      case IssueStatus.canceledByMember:
        return 'Hủy bởi thành viên';
      case IssueStatus.canceledByPartner:
        return 'Hủy bởi đối tác';
      case IssueStatus.succeeded:
        return 'Đã thành công';
      default:
        return "_ERROR_";
    }
  }
}
//#endregion

//#region - User -
enum UserGender {
  male,
  female,
  other,
}

extension UserGenderExtension on UserGender {
  String get name {
    switch (this) {
      case UserGender.male:
        return 'Nam';
      case UserGender.female:
        return 'Nữ';
      case UserGender.other:
        return 'Khác';
      default:
        return "_ERROR_";
    }
  }
}
//#endregion


//#region - User -
enum AuthorityRole {
  member,
  partner,
}

extension AuthorityExtension on AuthorityRole {
  String get key {
    switch (this) {
      case AuthorityRole.member:
        return 'ROLE_MEMBER';
      case AuthorityRole.partner:
        return 'ROLE_PARTNER';
    }
  }

  String get value {
    switch (this) {
      case AuthorityRole.member:
        return 'Thành viên';
      case AuthorityRole.partner:
        return 'Đối tác';
    }
  }
}
//#endregion