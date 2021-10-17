enum MenuState { home, favourite, message, profile }

//Issue
enum IssueCategory {
  brokenTire, //Hỏng lốp
  brokenBrake, //Hỏng phanh
  brokenChain, //Hỏng xích
  brokenEngine, //Hỏng động cơ, chết máy
  other, //Lỗi khác
}
enum IssueStatus {
  sent,
  waitMemberConfirm,
  memberConfirmPartner,
  canceledByMember,
  canceledByPartner,
  succeeded,
}

//User
enum UserGender {
  male,
  female,
  other,
}
